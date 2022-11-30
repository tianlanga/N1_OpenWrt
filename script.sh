#!/bin/bash
cd openwrt
# Add luci-app-adguardhome
# git clone https://github.com/rufengsuixing/luci-app-adguardhome.git package-temp/luci-app-adguardhome
# mv -f package-temp/luci-app-adguardhome package/lean/
# rm -rf package-temp

# Add luci-app-openclash
# git clone https://github.com/vernesong/OpenClash.git package-temp
# mv -f package-temp/luci-app-openclash package/lean/
# rm -rf package-temp
# Add luci-theme-opentomcat
#git clone https://github.com/Leo-Jo-My/luci-theme-opentomcat.git theme-temp/luci-theme-opentomcat
#rm -rf theme-temp/luci-theme-opentomcat/LICENSE
#rm -rf theme-temp/luci-theme-opentomcat/README.md
#mv -f theme-temp/luci-theme-opentomcat package/lean/
#rm -rf theme-temp
#default_theme='opentomcat'
#sed -i "s/bootstrap/$default_theme/g" feeds/luci/modules/luci-base/root/etc/config/luci

# Add luci-app-vssr
git clone https://github.com/jerrykuku/lua-maxminddb.git package-temp/lua-maxminddb
git clone https://github.com/jerrykuku/luci-app-vssr.git package-temp/luci-app-vssr
# git clone https://github.com/kenzok8/small.git package-temp/small
# cp -r package-temp/small/* package/lean/
mv -f package-temp/lua-maxminddb package/lean/
mv -f package-temp/luci-app-vssr package/lean/
rm -rf package-temp

# sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' ./feeds/luci/collections/luci/Makefile
sed -i 's/TARGET_rockchip/TARGET_rockchip\|\|TARGET_armvirt/g' package/lean/autocore/Makefile
sed -i "s/OpenWrt /tianlanga Build $(TZ=UTC-8 date "+%Y.%m.%d") @ OpenWrt /g" package/lean/default-settings/files/zzz-default-settings
sed -i 's/192.168.1.1/192.168.31.254/g' package/base-files/files/bin/config_generate
sed -i 's#https://github.com/breakings/OpenWrt#https://github.com/tianlanga/N1_OpenWrt#g' package/luci-app-amlogic/luci-app-amlogic/root/etc/config/amlogic
sed -i 's#ARMv8#openwrt_armvirt#g' package/luci-app-amlogic/luci-app-amlogic/root/etc/config/amlogic
sed -i 's#opt/kernel#kernel#g' package/luci-app-amlogic/luci-app-amlogic/root/etc/config/amlogic
# sed -i 's#mount -t cifs#mount.cifs#g' feeds/luci/applications/luci-app-cifs-mount/root/etc/init.d/cifs
sed -i 's/^\[/#&/g' package/network/config/firewall/files/firewall.user
echo 'iptables -t nat -I POSTROUTING -o eth0 - MASQUERADE' >> package/network/config/firewall/files/firewall.user
echo 'iptables -t nat -I POSTROUTING -o br-lan - MASQUERADE' >> package/network/config/firewall/files/firewall.user