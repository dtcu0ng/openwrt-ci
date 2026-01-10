# Change default IP to 10.6.7.1
sed -i 's/192.168.1.1/10.6.7.1/g' package/base-files/files/bin/config_generate

# Change default hostname to dtcg-router
# Method 1: Modify config_generate script to set hostname
if grep -q "uci set system.@system\[0\].hostname" package/base-files/files/bin/config_generate; then
    sed -i "s/uci set system.@system\[0\].hostname=.*/uci set system.@system[0].hostname='dtcg-router'/" package/base-files/files/bin/config_generate
elif grep -q "hostname=" package/base-files/files/bin/config_generate; then
    sed -i "s/hostname=.*/hostname='dtcg-router'/" package/base-files/files/bin/config_generate
fi

# Method 2: Set hostname in system config file
mkdir -p package/base-files/files/etc/config
if [ -f package/base-files/files/etc/config/system ]; then
    if grep -q "option hostname" package/base-files/files/etc/config/system; then
        sed -i "s/option hostname.*/option hostname 'dtcg-router'/" package/base-files/files/etc/config/system
    else
        sed -i "/^config system$/a\\\toption hostname 'dtcg-router'" package/base-files/files/etc/config/system
    fi
fi

rm -rf package/emortal/luci-app-athena-led
git clone --depth=1 https://github.com/NONGFAH/luci-app-athena-led package/luci-app-athena-led
chmod +x package/luci-app-athena-led/root/etc/init.d/athena_led package/luci-app-athena-led/root/usr/sbin/athena-led