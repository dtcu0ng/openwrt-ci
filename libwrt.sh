# Change default IP to 10.6.7.1
sed -i 's/192.168.1.1/10.6.7.1/g' package/base-files/files/bin/config_generate

sed -i 's/LibWrt/ctd-wrt/g' include/version.mk
sed -i 's/LibWrt/ctd-wrt/g' package/base-files/files/bin/config_generate
sed -i "s/timezone='CST-8'/timezone='ICT-7'/g" package/base-files/files/bin/config_generate
sed -i "s/zonename='Asia\/Shanghai'/zonename='Asia\/Ho_Chi_Minh'/g" package/base-files/files/bin/config_generate

sed -i "s/add_list system.ntp.server='ntp.tencent.com'/add_list system.ntp.server='0.openwrt.pool.ntp.org'/g" package/base-files/files/bin/config_generate
sed -i "s/add_list system.ntp.server='ntp.aliyun.com'/add_list system.ntp.server='1.openwrt.pool.ntp.org'/g" package/base-files/files/bin/config_generate
sed -i "s/add_list system.ntp.server='ntp.ntsc.ac.cn'/add_list system.ntp.server='2.openwrt.pool.ntp.org'/g" package/base-files/files/bin/config_generate
sed -i "s/add_list system.ntp.server='cn.ntp.org.cn'/add_list system.ntp.server='3.openwrt.pool.ntp.org'/g" package/base-files/files/bin/config_generate

sed -i 's/CONFIG_TARGET_OPTIMIZATION=.*/CONFIG_TARGET_OPTIMIZATION="-O3 -pipe -mcpu=cortex-a53+crypto+crc"/' .config
sed -i 's/CONFIG_DEFAULT_TARGET_OPTIMIZATION=.*/CONFIG_DEFAULT_TARGET_OPTIMIZATION="-O3 -pipe -mcpu=cortex-a53+crypto+crc"/' .config

rm -rf package/emortal/luci-app-athena-led
git clone --depth=1 https://github.com/NONGFAH/luci-app-athena-led package/luci-app-athena-led
chmod +x package/luci-app-athena-led/root/etc/init.d/athena_led package/luci-app-athena-led/root/usr/sbin/athena-led
