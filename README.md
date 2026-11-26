# iStoreOS for JDCloud RE-CS-02（京东云 AX6600 雅典娜）

用 GitHub Actions 云端编译 iStoreOS 固件，目标机型 `jdcloud_re-cs-02`，已适配为可直接在现有 OpenWrt 上 sysupgrade。

## 做了什么

官方 iStoreOS 源码（`istoreos-25.12`）没有这台机器的设备定义，`scripts/add-device.sh` 在编译前从上游 OpenWrt 移植：

- DTS：`ipq6010-re-cs.dtsi` / `ipq6010-re-cs-02.dts`
- `ipq60xx.mk` 增加 `Device/jdcloud_re-cs-02`
- `ipq-wifi` 增加 `ipq-wifi-jdcloud_re-cs-02`（BDF）
- `02_network` / `11-ath11k-caldata` / `platform.sh`（eMMC A/B 分区升级 + 配置保留）

## 内置应用

- iStore 应用商店
- Lucky：`lucky` + `luci-app-lucky`
- Clash：`luci-app-clash`（核心组件在界面内下载）
- OAF：`appfilter` + `kmod-oaf` + `luci-app-oaf`（编译器如不支持内核模块会自动回退为不含 OAF 的固件）

第三方包不做整包 feed，只拷 `package/` 下需要的目录，避开 kenzok8 整包带来的 Kconfig 递归依赖冲突。

## 参考

- 上游支持：openwrt/openwrt commit `53a8e7b`
- 同类构建：[ZqinKing/wrt_release](https://github.com/ZqinKing/wrt_release)（`wrt_core/deconfig/jdcloud_ipq60xx_libwrt.config` 可对照包清单）
- Lucky/Clash 包：kenzok8/small-package；OAF：destan19/OpenAppFilter

## 升级方式

当前系统已经是 OpenWrt（同机型），可直接：

```sh
sysupgrade -n /tmp/xxx-squashfs-sysupgrade.bin   # -n 表示不保留配置，跨系统首次建议
```

或在 LuCI「系统 → 备份/升级」上传固件（同样建议不勾选保留配置）。

若分区表/引导器与原机不同，则改用 initramfs + TFTP 方式：

1. `*initramfs*` 改名 `initramfs.itb`，TFTP 服务器发布。
2. 串口进 U-Boot（原厂 4.3.0.r4211 以上输入 `jdmt018R` 打断自动启动）。
3. `tftpboot initramfs.itb` → `bootm`，进系统后上传 sysupgrade 包升级。
