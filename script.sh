#!/bin/bash
cd openwrt
# Add luci-app-adguardhome
git clone https://github.com/rufengsuixing/luci-app-adguardhome.git package-temp/luci-app-adguardhome
mv -f package-temp/luci-app-adguardhome package/lean/
rm -rf package-temp

# Add luci-app-openclash
git clone https://github.com/vernesong/OpenClash.git package-temp
mv -f package-temp/luci-app-openclash package/lean/
rm -rf package-temp

# Add luci-theme-opentomcat
git clone https://github.com/jerrykuku/luci-app-argon-config.git package-temp
mv -f package-temp/luci-app-argon-config package/lean/
rm -rf package-temp

# Add luci-app-vssr
git clone https://github.com/jerrykuku/lua-maxminddb.git package-temp/lua-maxminddb
git clone https://github.com/jerrykuku/luci-app-vssr.git package-temp/luci-app-vssr
git clone https://github.com/kenzok8/small.git package-temp/small
cp -r package-temp/small/* package/lean/
mv -f package-temp/lua-maxminddb package/lean/
mv -f package-temp/luci-app-vssr package/lean/
rm -rf package-temp

# Change modify config/luci
sed -i "s/OpenWrt /tianlanga Build $(TZ=UTC-8 date "+%Y.%m.%d") @ OpenWrt /g" package/lean/default-settings/files/zzz-default-settings
sed -i 's/192.168.1.1/192.168.31.254/g' package/base-files/files/bin/config_generate