#!/usr/bin/env bash
# 为 iStoreOS 源码树添加 JDCloud RE-CS-02 (AX6600 雅典娜) 设备支持
# 用法: bash add-device.sh <iStoreOS 源码根目录>
set -euo pipefail

TOP="${1:-$PWD}"
HERE="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DEV="$HERE/../device"

QCAX="$TOP/target/linux/qualcommax"
DTSDIR="$QCAX/files/arch/arm64/boot/dts/qcom"

[ -d "$QCAX" ] || { echo "!! $QCAX 不存在" ; exit 1; }

echo "==> 1/4 安装 DTS / DTSI"
install -m 0644 "$DEV/ipq6010-re-cs.dtsi" "$DTSDIR/"
install -m 0644 "$DEV/ipq6010-re-cs-02.dts" "$DTSDIR/"

echo "==> 2/4 打补丁（Kconfig / 镜像定义 / 网络 / 校准 / 升级）"
python3 - "$TOP" <<'PY'
import sys, io, os, re

top = sys.argv[1]
ipq60xx = os.path.join(top, "target/linux/qualcommax/image/ipq60xx.mk")
ipqwifi = os.path.join(top, "package/firmware/ipq-wifi/Makefile")
netfile = os.path.join(top, "target/linux/qualcommax/ipq60xx/base-files/etc/board.d/02_network")
calfile = os.path.join(top, "target/linux/qualcommax/ipq60xx/base-files/etc/hotplug.d/firmware/11-ath11k-caldata")
plat    = os.path.join(top, "target/linux/qualcommax/ipq60xx/base-files/lib/upgrade/platform.sh")

def read(p):
    with io.open(p, "r", encoding="utf-8", newline="") as f:
        return f.read()

def write(p, s):
    with io.open(p, "w", encoding="utf-8", newline="") as f:
        f.write(s)

def need(cond, msg):
    if not cond:
        raise SystemExit("!! " + msg)

# ---------- 1. 镜像定义 ----------
mk = read(ipq60xx)
need("Device/jdcloud_re-cs-02" not in mk, "ipq60xx.mk 已包含该设备，跳过前请确认")
anchor = "TARGET_DEVICES += glinet_gl-axt1800\n"
need(mk.count(anchor) == 1, "ipq60xx.mk 锚点 glinet_gl-axt1800 未找到")
block = anchor + """
define Device/jdcloud_re-cs-02
	$(call Device/FitImage)
	DEVICE_VENDOR := JDCloud
	DEVICE_MODEL := RE-CS-02
	SOC := ipq6010
	BLOCKSIZE := 64k
	KERNEL_SIZE := 6144k
	DEVICE_DTS_CONFIG := config@cp03-c3
	DEVICE_PACKAGES := ath11k-firmware-qcn9074 ipq-wifi-jdcloud_re-cs-02 kmod-ath11k-pci kmod-fs-f2fs f2fs-tools
endef
TARGET_DEVICES += jdcloud_re-cs-02
"""
mk = mk.replace(anchor, block, 1)
write(ipq60xx, mk)

# ---------- 2. ipq-wifi Board Data File ----------
wf = read(ipqwifi)
need("jdcloud_re-cs-02" not in wf, "ipq-wifi 已包含 jdcloud_re-cs-02")
need(wf.count("\tiodata_wn-dax3000gr \\\n") == 1, "ipq-wifi ALLWIFIBOARDS 锚点未找到")
wf = wf.replace("\tiodata_wn-dax3000gr \\\n", "\tiodata_wn-dax3000gr \\\n\tjdcloud_re-cs-02 \\\n", 1)
gen = "$(eval $(call generate-ipq-wifi-package,iodata_wn-dax3000gr,I-O DATA WN-DAX3000GR))\n"
need(wf.count(gen) == 1, "ipq-wifi generate 锚点未找到")
wf = wf.replace(gen, gen + "$(eval $(call generate-ipq-wifi-package,jdcloud_re-cs-02,JDCloud RE-CS-02))\n", 1)
write(ipqwifi, wf)

# ---------- 3. 默认网络接口 ----------
nf = read(netfile)
need("jdcloud,re-cs-02" not in nf, "02_network 已包含该设备")
a = "\tglinet,gl-ax1800|\\\n\tlinksys,mr7350"
need(nf.count(a) == 1, "02_network 锚点未找到")
nf = nf.replace(a, "\tglinet,gl-ax1800|\\\n\tjdcloud,re-cs-02|\\\n\tlinksys,mr7350", 1)
write(netfile, nf)

# ---------- 4. ath11k 校准数据 ----------
cf = read(calfile)
need("jdcloud,re-cs-02" not in cf, "11-ath11k-caldata 已包含该设备")
marker = '"ath11k/QCN9074/hw1.0/cal-pci-0000:01:00.0.bin")'
need(cf.count(marker) == 1, "QCN9074 段落标记未找到")
ahb, qcn = cf.split(marker, 1)
need("\tcambiumnetworks,xe3-4)\n" in ahb, "AHB 段锚点未找到")
ahb = ahb.replace("\tcambiumnetworks,xe3-4)\n",
                  "\tjdcloud,re-cs-02)\n\t\tcaldata_extract_mmc \"0:ART\" 0x1000 0x10000\n\t\t;;\n\tcambiumnetworks,xe3-4)\n", 1)
need("\tlinksys,mr7500)\n" in qcn, "QCN9074 段锚点未找到")
qcn = qcn.replace("\tlinksys,mr7500)\n",
                  "\tjdcloud,re-cs-02)\n\t\tcaldata_extract_mmc \"0:ART\" 0x26800 0x20000\n\t\t;;\n\tlinksys,mr7500)\n", 1)
write(calfile, ahb + marker + qcn)

# ---------- 5. 升级逻辑（eMMC A/B 分区） ----------
ps = read(plat)
need("jdcloud,re-cs-02" not in ps, "platform.sh 已包含该设备")
a5 = "\tnetgear,wax610|\\\n"
need(ps.count(a5) == 1, "platform.sh 锚点未找到")
jd = """\tjdcloud,re-cs-02)
		local cfgpart=$(find_mmc_part "0:BOOTCONFIG")
		part_num="$(hexdump -e '1/1 "%01x|"' -n 1 -s 148 -C $cfgpart | cut -f 1 -d "|" | head -n1)"
		if [ "$part_num" -eq "1" ]; then
			CI_KERNPART="0:HLOS_1"
			CI_ROOTPART="rootfs_1"
		else
			CI_KERNPART="0:HLOS"
			CI_ROOTPART="rootfs"
		fi
		emmc_do_upgrade "$1"
		;;
"""
ps = ps.replace(a5, jd + a5, 1)
ps = ps.rstrip("\n") + """

platform_copy_config() {
	case "$(board_name)" in
	jdcloud,re-cs-02)
		emmc_copy_config
		;;
	esac
}
"""
write(plat, ps)
print("   补丁应用完成")
PY

echo "==> 3/4 自检"
grep -q "jdcloud_re-cs-02" "$QCAX/image/ipq60xx.mk" && echo "   ipq60xx.mk OK"
grep -q "jdcloud_re-cs-02" "$TOP/package/firmware/ipq-wifi/Makefile" && echo "   ipq-wifi OK"
grep -q "jdcloud,re-cs-02" "$QCAX/ipq60xx/base-files/etc/board.d/02_network" && echo "   02_network OK"
grep -q "jdcloud,re-cs-02" "$QCAX/ipq60xx/base-files/etc/hotplug.d/firmware/11-ath11k-caldata" && echo "   caldata OK"
grep -q "jdcloud,re-cs-02" "$QCAX/ipq60xx/base-files/lib/upgrade/platform.sh" && echo "   platform.sh OK"
ls -l "$DTSDIR/ipq6010-re-cs.dtsi" "$DTSDIR/ipq6010-re-cs-02.dts"

echo "==> 4/4 完成"
