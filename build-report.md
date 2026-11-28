# 构建报告（成功）

- 运行编号：#8
- 源码：istoreos-25.12（111a980）
- 时间：2026-11-28 14:58 UTC

## 产物
```
total 80M
-rw-r--r-- 1 runner runner 1.6K Nov 28 13:18 config.buildinfo
-rw-r--r-- 1 runner runner  670 Nov 28 13:18 feeds.buildinfo
-rw-r--r-- 1 runner runner  40M Nov 28 14:58 istoreos-qualcommax-ipq60xx-jdcloud_re-cs-02-initramfs-uImage.itb
-rw-r--r-- 1 runner runner  41M Nov 28 14:58 istoreos-qualcommax-ipq60xx-jdcloud_re-cs-02-squashfs-sysupgrade.bin
-rw-r--r-- 1 runner runner 6.5K Nov 28 14:58 istoreos-qualcommax-ipq60xx-jdcloud_re-cs-02.manifest
drwxr-xr-x 2 runner runner 4.0K Nov 28 14:58 packages
-rw-r--r-- 1 runner runner 1.8K Nov 28 14:58 profiles.json
-rw-r--r-- 1 runner runner  716 Nov 28 14:58 sha256sums
-rw-r--r-- 1 runner runner   11 Nov 28 13:18 version.buildinfo
```

## 最终内置应用
```
CONFIG_PACKAGE_appfilter=y
CONFIG_PACKAGE_kmod-oaf=y
CONFIG_PACKAGE_luci-app-oaf=y
CONFIG_PACKAGE_luci-app-openclash=y
CONFIG_PACKAGE_lucky=y
```

## SHA256
```
56d004fb32229c1d7570e106a2f3baf4827eabc0570561e1d49eedc3b38c5994  bin/targets/qualcommax/ipq60xx/config.buildinfo
c200a7cbf9dacbab12e37ddf96361df256f24446500808234dc9a84f6a97c506  bin/targets/qualcommax/ipq60xx/feeds.buildinfo
70ad621d0294941bd7b500b4e4caf5d4df92826a5717f7047245c97ffbe1a2f2  bin/targets/qualcommax/ipq60xx/istoreos-qualcommax-ipq60xx-jdcloud_re-cs-02-initramfs-uImage.itb
c1e6a3e122f9e261b5651d22147f8feee705eaff6f87808e387f8ca19553de8f  bin/targets/qualcommax/ipq60xx/istoreos-qualcommax-ipq60xx-jdcloud_re-cs-02-squashfs-sysupgrade.bin
a9a4356b13db6256106cba46113dd0427d88f40f8d7006522d3c04cafdf39d6b  bin/targets/qualcommax/ipq60xx/istoreos-qualcommax-ipq60xx-jdcloud_re-cs-02.manifest
c2dd8b70640ee68839242225a9938152a97032055d4953ffb7a9f15874eefe0d  bin/targets/qualcommax/ipq60xx/profiles.json
1cc73408ab435ebf86e1c94927d5291c973e716fafc3fc3da6ef0aca52363dce  bin/targets/qualcommax/ipq60xx/sha256sums
aed743b0c799b3c4625f5cc7df09f9c39e637f56b5c19b5436b12c43ef7759f7  bin/targets/qualcommax/ipq60xx/version.buildinfo
