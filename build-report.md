# 构建报告（失败，job: failure）

- 运行编号：#5
- 源码：istoreos-25.12（111a980）
- 时间：2026-11-26 14:54 UTC

## 产物
```
(无产物目录)
```

## setup.log 末尾
```

tmp/.config-package.in:34317:error: recursive dependency detected!
tmp/.config-package.in:34317:	symbol PACKAGE_php8 is selected by PACKAGE_luci-app-nekobox
tmp/.config-package.in:68879:	symbol PACKAGE_luci-app-nekobox depends on PHP8_INTL
feeds/packages/lang/php8/Config.in:27:	symbol PHP8_INTL depends on PACKAGE_php8
For a resolution refer to Documentation/kbuild/kconfig-language.rst
subsection "Kconfig recursive dependency limitations"

tmp/.config-package.in:142408:error: recursive dependency detected!
tmp/.config-package.in:142408:	symbol PACKAGE_xz-utils is selected by PACKAGE_mise-runtime
tmp/.config-package.in:151142:	symbol PACKAGE_mise-runtime is selected by PACKAGE_luci-app-hermes
tmp/.config-package.in:67864:	symbol PACKAGE_luci-app-hermes depends on PACKAGE_xz-utils
For a resolution refer to Documentation/kbuild/kconfig-language.rst
subsection "Kconfig recursive dependency limitations"

tmp/.config-package.in:70267:error: recursive dependency detected!
tmp/.config-package.in:70267:	symbol PACKAGE_luci-app-ssr-plus depends on PACKAGE_luci-app-ssr-plus
For a resolution refer to Documentation/kbuild/kconfig-language.rst
subsection "Kconfig recursive dependency limitations"

tmp/.config-package.in:68816:error: recursive dependency detected!
tmp/.config-package.in:68816:	symbol PACKAGE_luci-app-nat6-helper depends on PACKAGE_luci-app-nat6-helper
For a resolution refer to Documentation/kbuild/kconfig-language.rst
subsection "Kconfig recursive dependency limitations"

tmp/.config-package.in:68658:error: recursive dependency detected!
tmp/.config-package.in:68658:	symbol PACKAGE_luci-app-momo depends on PACKAGE_luci-app-momo
For a resolution refer to Documentation/kbuild/kconfig-language.rst
subsection "Kconfig recursive dependency limitations"

tmp/.config-package.in:71276:error: recursive dependency detected!
tmp/.config-package.in:71276:	symbol PACKAGE_luci-app-weechat depends on PACKAGE_luci-app-weechat
For a resolution refer to Documentation/kbuild/kconfig-language.rst
subsection "Kconfig recursive dependency limitations"

tmp/.config-package.in:137203:error: recursive dependency detected!
tmp/.config-package.in:137203:	symbol PACKAGE_momo depends on PACKAGE_momo
For a resolution refer to Documentation/kbuild/kconfig-language.rst
subsection "Kconfig recursive dependency limitations"

tmp/.config-package.in:137353:error: recursive dependency detected!
tmp/.config-package.in:137353:	symbol PACKAGE_natmap is selected by PACKAGE_natmap
For a resolution refer to Documentation/kbuild/kconfig-language.rst
subsection "Kconfig recursive dependency limitations"

tmp/.config-package.in:140141:error: recursive dependency detected!
tmp/.config-package.in:140141:	symbol PACKAGE_tor is selected by PACKAGE_luci-app-torbp
tmp/.config-package.in:72172:	symbol PACKAGE_luci-app-torbp depends on PACKAGE_tor
For a resolution refer to Documentation/kbuild/kconfig-language.rst
subsection "Kconfig recursive dependency limitations"

tmp/.config-package.in:66407:error: recursive dependency detected!
tmp/.config-package.in:66407:	symbol PACKAGE_luci-app-alist depends on PACKAGE_luci-app-alist
For a resolution refer to Documentation/kbuild/kconfig-language.rst
subsection "Kconfig recursive dependency limitations"

tmp/.config-package.in:113067:error: recursive dependency detected!
tmp/.config-package.in:113067:	symbol PACKAGE_ip6tables-mod-fullconenat depends on PACKAGE_ip6tables-mod-fullconenat
For a resolution refer to Documentation/kbuild/kconfig-language.rst
subsection "Kconfig recursive dependency limitations"

#
# configuration written to .config
#
---- 关键配置 ----
CONFIG_TARGET_qualcommax_ipq60xx_DEVICE_jdcloud_re-cs-02=y
CONFIG_TARGET_PROFILE="DEVICE_jdcloud_re-cs-02"
CONFIG_DEFAULT_luci-app-store=y
# CONFIG_PACKAGE_luci-app-clashoo is not set
# CONFIG_PACKAGE_luci-app-lucky is not set
# CONFIG_PACKAGE_luci-app-oaf is not set
# CONFIG_PACKAGE_clashoo is not set
---- 包存在性校验 ----
MISS luci-app-lucky
MISS lucky
MISS luci-app-clashoo
MISS clashoo
MISS luci-app-oaf
MISS open-app-filter
!! 关键包未选中，终止
```

## build.log 末尾
```
(无 build.log)
```
