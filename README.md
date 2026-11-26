# iStoreOS for JDCloud RE-CS-02（京东云 AX6600 雅典娜）

用 GitHub Actions 云端编译 iStoreOS 固件，目标机型 `jdcloud_re-cs-02`。

## 做了什么

官方 iStoreOS 源码（分支 `istoreos-25.12`）本身**没有**这台机器的设备定义，因此 `scripts/add-device.sh`
会在编译前把上游 OpenWrt 的 RE-CS-02 支持移植进来：

- `target/linux/qualcommax/files/arch/arm64/boot/dts/qcom/ipq6010-re-cs.dtsi`、`ipq6010-re-cs-02.dts`
- `target/linux/qualcommax/image/ipq60xx.mk` 增加 `Device/jdcloud_re-cs-02`
- `package/firmware/ipq-wifi/Makefile` 增加 `ipq-wifi-jdcloud_re-cs-02`（BDF 由 ipq-wifi 源码提供）
- `02_network`、`11-ath11k-caldata`、`platform.sh` 增加设备适配（含 eMMC A/B 分区升级与配置保留）

## 内置应用

- iStore 应用商店（`luci-app-store` / `istore`）
- Lucky（`lucky` + `luci-app-lucky`）
- Clash：`clashoo` + `luci-app-clashoo`（kenzok8/small-package，25.12 上用的这套）
- OAF：`open-app-filter` + `luci-app-oaf`

第三方包来自 `src-git kenzo https://github.com/kenzok8/small-package.git`。

## 参考

- 设备上游支持：openwrt/openwrt commit `53a8e7b`（qualcommax: ipq60xx: add JDCloud RE-CS-02 support）
- 同类构建参考：[ZqinKing/wrt_release](https://github.com/ZqinKing/wrt_release)（其 `deconfig/jdcloud_ipq60xx_libwrt.config` 里有这台机的包清单可对照）

## 使用

1. Actions 里运行 `Build iStoreOS for JDCloud RE-CS-02`，或在 main 上推送触发。
2. 完成后下载 Artifacts `istoreos-jdcloud-re-cs-02`（对应 `bin/targets/qualcommax/ipq60xx/`）。

## 刷机

eMMC 设备，先用 U-Boot 加载 initramfs，再在系统里 sysupgrade：

1. 把 `*initramfs*` 重命名为 `initramfs.itb`，用 TFTP 服务器发布。
2. 串口进 U-Boot（原厂固件 4.3.0.r4211 及以上需输入 `jdmt018R` 打断自动启动）。
3. `tftpboot initramfs.itb` → `bootm`，进入临时系统。
4. 用 scp / LuCI 上传 `*sysupgrade.bin` 执行升级。

> 需要事先刷好第三方 U-Boot 与 GPT 分区表，或已处于可 TFTP 引导的状态。
