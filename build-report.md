# 构建报告（失败，job: failure）

- 运行编号：#6
- 源码：istoreos-25.12（111a980）
- 时间：2026-11-26 15:02 UTC

## 产物
```
(无产物目录)
```

## setup.log 末尾
```
Installing package 'qt5translations' from video
Installing package 'qt5virtualkeyboard' from video
Installing package 'sdl2-doom' from video
Installing package 'sdl2-mixer' from video
Installing package 'vkmark' from video
Installing package 'wayland-utils' from video
Installing package 'weston' from video
Installing package 'luci-app-store' from store
Installing all packages from feed store.
Installing package 'luci-lib-taskd' from store
Installing package 'luci-lib-xterm' from store
Installing package 'taskd' from store
Installing package 'ddns-scripts_aliyun' from third
Installing all packages from feed third.
Installing package 'luci-app-argon-config' from third
Installing package 'luci-theme-argon' from third
Installing package 'luci-app-autotimeset' from third
Installing package 'luci-app-baidupcs-web' from third
WARNING: No feed for package 'baidupcs-web' found
Installing package 'luci-app-cifs-mount' from third
Installing package 'luci-app-filetransfer' from third
Installing package 'luci-lib-fs' from third
Installing package 'luci-app-nfs' from third
Installing package 'luci-app-tn-netports' from third
Installing package 'luci-app-vlmcsd' from third
Installing package 'vlmcsd' from third
Installing package 'webdavfs' from third

WARNING: Makefile 'package/feeds/third/luci-app-baidupcs-web/Makefile' has a dependency on 'baidupcs-web', which does not exist
WARNING: Makefile 'package/feeds/packages/prosody/Makefile' has a dependency on 'luafilesystem5.4', which does not exist
WARNING: Makefile 'package/feeds/packages/prosody/Makefile' has a dependency on 'luaexpat5.4', which does not exist
WARNING: Makefile 'package/feeds/packages/prosody/Makefile' has a dependency on 'luasec5.4', which does not exist
WARNING: Makefile 'package/feeds/packages/prosody/Makefile' has a dependency on 'luasocket5.4', which does not exist
tmp/.config-package.in:66836:error: recursive dependency detected!
tmp/.config-package.in:66836:	symbol PACKAGE_luci-app-weechat depends on PACKAGE_luci-app-weechat
For a resolution refer to Documentation/kbuild/kconfig-language.rst
subsection "Kconfig recursive dependency limitations"

#
# configuration written to .config
#
---- 关键配置 ----
CONFIG_TARGET_qualcommax_ipq60xx_DEVICE_jdcloud_re-cs-02=y
CONFIG_TARGET_PROFILE="DEVICE_jdcloud_re-cs-02"
CONFIG_DEFAULT_luci-app-store=y
CONFIG_PACKAGE_appfilter=y
CONFIG_PACKAGE_kmod-oaf=y
CONFIG_PACKAGE_luci-app-clash=y
# CONFIG_PACKAGE_luci-app-lucky is not set
CONFIG_PACKAGE_luci-app-oaf=y
CONFIG_PACKAGE_luci-i18n-oaf-zh-cn=y
CONFIG_PACKAGE_lucky=y
---- 包存在性校验 ----
MISS luci-app-lucky
OK   lucky
OK   luci-app-clash
OK   luci-app-oaf
OK   appfilter
OK   kmod-oaf
!! 关键包未选中，终止
```

## build.log 末尾
```
(无 build.log)
```
