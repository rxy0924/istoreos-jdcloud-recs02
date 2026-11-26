# 构建报告（失败，job: failure）

- 运行编号：#7
- 源码：istoreos-25.12（111a980）
- 时间：2026-11-26 15:59 UTC

## 产物
```
total 24K
-rw-r--r-- 1 runner runner 1.7K Nov 26 15:57 config.buildinfo
-rw-r--r-- 1 runner runner  670 Nov 26 15:57 feeds.buildinfo
drwxr-xr-x 2 runner runner  12K Nov 26 15:59 packages
-rw-r--r-- 1 runner runner   11 Nov 26 15:57 version.buildinfo
```

## setup.log 末尾
```
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
---- luci-app-lucky 依赖诊断 ----
dep lua: kconfig_present=0 config=CONFIG_PACKAGE_lua=y
dep libubus-lua: kconfig_present=0 config=CONFIG_PACKAGE_libubus-lua=y
dep libuci-lua: kconfig_present=0 config=CONFIG_PACKAGE_libuci-lua=y
dep luci-lib-nixio: kconfig_present=0 config=CONFIG_PACKAGE_luci-lib-nixio=y
dep luci-lib-jsonc: kconfig_present=0 config=CONFIG_PACKAGE_luci-lib-jsonc=y
dep luci-lib-ip: kconfig_present=0 config=CONFIG_PACKAGE_luci-lib-ip=y
dep rpcd-mod-file: kconfig_present=0 config=CONFIG_PACKAGE_rpcd-mod-file=y
---- 包存在性校验 ----
OK   lucky
OK   luci-app-clash
WARN luci-app-lucky 未选中（不影响主体编译）
OK   luci-app-oaf
OK   appfilter
OK   kmod-oaf
```

## build.log 末尾
```
make -r world: build failed. Please re-run make with -j1 V=s or V=sc for a higher verbosity level to see what's going on
make: *** [/home/runner/work/istoreos-jdcloud-recs02/istoreos-jdcloud-recs02/openwrt/include/toplevel.mk:237: world] Error 1
!! 首次编译失败，去掉 OAF 相关包后重试
# CONFIG_PACKAGE_appfilter is not set
# CONFIG_PACKAGE_kmod-oaf is not set
# CONFIG_PACKAGE_luci-app-oaf is not set
CONFIG_PACKAGE_luci-i18n-oaf-zh-cn=y
subsection "Kconfig recursive dependency limitations"

#
# configuration written to .config
#
WARNING: Makefile 'package/feeds/third/luci-app-baidupcs-web/Makefile' has a dependency on 'baidupcs-web', which does not exist
WARNING: Makefile 'package/feeds/packages/prosody/Makefile' has a dependency on 'luafilesystem5.4', which does not exist
WARNING: Makefile 'package/feeds/packages/prosody/Makefile' has a dependency on 'luaexpat5.4', which does not exist
WARNING: Makefile 'package/feeds/packages/prosody/Makefile' has a dependency on 'luasec5.4', which does not exist
WARNING: Makefile 'package/feeds/packages/prosody/Makefile' has a dependency on 'luasocket5.4', which does not exist
make[2]: Entering directory '/home/runner/work/istoreos-jdcloud-recs02/istoreos-jdcloud-recs02/openwrt/scripts/config'
make[2]: 'conf' is up to date.
make[2]: Leaving directory '/home/runner/work/istoreos-jdcloud-recs02/istoreos-jdcloud-recs02/openwrt/scripts/config'
make[4]: Entering directory '/home/runner/work/istoreos-jdcloud-recs02/istoreos-jdcloud-recs02/openwrt/target/linux'
make[5]: Entering directory '/home/runner/work/istoreos-jdcloud-recs02/istoreos-jdcloud-recs02/openwrt/target/linux/qualcommax'
make[6]: Entering directory '/home/runner/work/istoreos-jdcloud-recs02/istoreos-jdcloud-recs02/openwrt/target/linux/qualcommax/image'
make[6]: Leaving directory '/home/runner/work/istoreos-jdcloud-recs02/istoreos-jdcloud-recs02/openwrt/target/linux/qualcommax/image'
make[5]: Leaving directory '/home/runner/work/istoreos-jdcloud-recs02/istoreos-jdcloud-recs02/openwrt/target/linux/qualcommax'
make[4]: Leaving directory '/home/runner/work/istoreos-jdcloud-recs02/istoreos-jdcloud-recs02/openwrt/target/linux'
time: target/linux/prereq#0.23#0.13#0.35
 make[1] world
 make[2] package/cleanup
 make[2] target/compile
 make[3] -C target/linux compile
 make[2] buildinfo
 make[2] package/compile
 make[3] -C package/utils/lua host-compile
 make[3] -C package/libs/ncurses host-compile
 make[3] -C package/system/fwtool host-compile
 make[3] diffconfig buildversion feedsversion
 make[3] -C package/libs/libjson-c host-compile
 make[3] -C package/system/usign host-compile
 make[3] -C feeds/luci/modules/luci-base host-compile
 make[3] -C feeds/luci/contrib/package/csstidy host-compile
 make[3] -C package/system/apk host-compile
 make[3] -C package/libs/libubox host-compile
 make[3] -C package/libs/toolchain compile
 make[4] scripts/config/conf
 make[3] -C package/kernel/gpio-button-hotplug compile
 make[3] -C package/system/ucert host-compile
 make[3] -C package/kernel/qca-ssdk compile
 make[3] -C package/kernel/qca-nss-dp compile
 make[3] -C feeds/packages/utils/attr compile
 make[3] -C package/libs/libnl-tiny compile
 make[3] -C package/libs/libjson-c compile
 make[3] -C package/utils/lua compile
 make[3] -C package/libs/libmd compile
 make[3] -C package/libs/zlib compile
 make[3] -C package/firmware/linux-firmware compile
 make[3] -C package/system/fwtool compile
 make[3] -C package/libs/libsepol compile
 make[3] -C package/libs/pcre2 compile
 make[3] -C package/libs/musl-fts compile
 make[3] -C package/system/openwrt-keyring compile
 make[3] -C feeds/luci/libs/luci-lib-ip compile
 make[3] -C feeds/luci/libs/luci-lib-jsonc compile
 make[3] -C feeds/luci/libs/luci-lib-nixio compile
 make[3] -C feeds/packages/utils/acl compile
 make[3] -C package/libs/gmp compile
 make[3] -C package/libs/libcap compile
 make[3] -C package/system/ca-certificates compile
 make[3] -C feeds/packages/libs/nghttp2 compile
 make[3] -C package/libs/mbedtls compile
 make[3] -C feeds/packages/libs/sqlite3 compile
 make[3] -C package/libs/openssl compile
 make[3] -C package/firmware/ath11k-firmware compile
 make[3] -C package/firmware/ipq-wifi compile
 make[3] -C package/firmware/wireless-regdb compile
 make[3] -C package/network/utils/iw compile
 make[3] -C package/libs/jansson compile
 make[3] -C package/libs/libmnl compile
 make[3] -C package/lucky compile
 make[3] -C package/network/services/dropbear compile
 make[3] -C package/libs/libpcap compile
 make[3] -C package/network/utils/linux-atm compile
 make[3] -C package/network/utils/resolveip compile
 make[3] -C package/libs/libubox compile
 make[3] -C package/kernel/linux compile
 make[3] -C package/libs/ncurses compile
 make[3] -C package/libs/libselinux compile
 make[3] -C package/system/usign compile
 make[3] -C feeds/packages/utils/coreutils compile
 make[3] -C feeds/packages/net/curl compile
 make[3] -C feeds/packages/net/wget compile
 make[3] -C package/libs/libnftnl compile
 make[3] -C package/libs/ustream-ssl compile
 make[3] -C package/libs/ustream-ssl compile
 make[3] -C package/system/mtd compile
 make[3] -C package/system/urngd compile
 make[3] -C package/system/ubus compile
 make[3] -C package/system/uci compile
 make[3] -C package/utils/util-linux compile
 make[3] -C package/utils/jsonfilter compile
 make[3] -C package/network/utils/iwinfo compile
 make[3] -C feeds/packages/net/cgi-io compile
 make[3] -C package/libs/readline compile
 make[3] -C package/network/utils/ipset compile
 make[3] -C package/network/utils/iptables compile
 make[3] -C package/network/utils/nftables compile
 make[3] -C package/network/ipv6/odhcp6c compile
 make[3] -C package/network/services/dnsmasq compile
 make[3] -C package/network/services/odhcpd compile
 make[3] -C package/network/services/ppp compile
 make[3] -C package/utils/f2fs-tools compile
 make[3] -C package/utils/ucode compile
 make[3] -C package/utils/f2fs-tools compile
 make[3] -C package/utils/f2fs-tools compile
 make[3] -C package/utils/mtd-utils compile
 make[3] -C package/utils/e2fsprogs compile
 make[3] -C package/utils/f2fs-tools compile
 make[3] -C package/utils/busybox compile
 make[3] -C feeds/luci/contrib/package/lucihttp compile
 make[3] -C package/system/rpcd compile
 make[3] -C feeds/luci/contrib/package/ucode-mod-html compile
 make[3] -C feeds/luci/contrib/package/ucode-mod-lua compile
 make[3] -C feeds/packages/utils/bash compile
 make[3] -C package/libs/uclient compile
 make[3] -C package/network/config/firewall4 compile
 make[3] -C package/system/apk compile
 make[3] -C package/libs/udebug compile
 make[3] -C feeds/luci/libs/rpcd-mod-luci compile
 make[3] -C feeds/luci/libs/luci-lib-base compile
 make[3] -C package/network/services/hostapd compile
 make[3] -C package/network/config/netifd compile
 make[3] -C package/system/ubox compile
 make[3] -C feeds/luci/modules/luci-base compile
 make[3] -C package/network/config/wifi-scripts compile
 make[3] -C package/system/urandom-seed compile
 make[3] -C package/system/fstools compile
 make[3] -C feeds/luci/modules/luci-lua-runtime compile
 make[3] -C package/kernel/mac80211 compile
 make[3] -C package/system/procd compile
 make[3] -C package/boot/uboot-tools compile
 make[3] -C feeds/luci/modules/luci-compat compile
 make[3] -C package/base-files compile
 make[3] -C feeds/third/luci-theme-argon compile
 make[3] -C package/luci-app-clash compile
luci-theme-argon does not support CSS source minification
luci-theme-argon does not support CSS source minification
 make[3] -C package/istoreos-files compile
    ERROR: package/luci-app-clash failed to build.
make -r world: build failed. Please re-run make with -j1 V=s or V=sc for a higher verbosity level to see what's going on
make: *** [/home/runner/work/istoreos-jdcloud-recs02/istoreos-jdcloud-recs02/openwrt/include/toplevel.mk:237: world] Error 1
```
