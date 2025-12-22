#!/bin/bash
set -e
# 修改默认IP
sed -i 's/192.168.1.1/10.6.7.1/g' package/base-files/files/bin/config_generate


./scripts/feeds update -a
./scripts/feeds install -a
