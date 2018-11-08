#!/bin/bash

set -e

[ -z "$CPUS" ] && CPUS="$(nproc)"

cat >.config <<EOF
CONFIG_TARGET_ar71xx=y
CONFIG_TARGET_ar71xx_generic=y
CONFIG_TARGET_MULTI_PROFILE=y
CONFIG_TARGET_DEVICE_ar71xx_generic_DEVICE_archer-c7-v2=y
CONFIG_TARGET_DEVICE_ar71xx_generic_DEVICE_archer-c7-v4=y
CONFIG_TARGET_DEVICE_ar71xx_generic_DEVICE_tl-wr1043n-v5=y
CONFIG_TARGET_DEVICE_ar71xx_generic_DEVICE_tl-wr1043nd-v1=y
CONFIG_TARGET_DEVICE_ar71xx_generic_DEVICE_tl-wr1043nd-v2=y
CONFIG_TARGET_DEVICE_ar71xx_generic_DEVICE_tl-wr1043nd-v3=y
CONFIG_TARGET_DEVICE_ar71xx_generic_DEVICE_tl-wr1043nd-v4=y
CONFIG_TARGET_DEVICE_ar71xx_generic_DEVICE_tl-wr841-v10=y
CONFIG_TARGET_DEVICE_ar71xx_generic_DEVICE_tl-wr841-v11=y
CONFIG_TARGET_DEVICE_ar71xx_generic_DEVICE_tl-wr841-v12=y
CONFIG_TARGET_DEVICE_ar71xx_generic_DEVICE_tl-wr841-v8=y
CONFIG_TARGET_DEVICE_ar71xx_generic_DEVICE_tl-wr841-v9=y
CONFIG_DEVEL=y
CONFIG_BUILD_LOG=y
CONFIG_TARGET_INITRAMFS_COMPRESSION_LZMA=y
CONFIG_TARGET_ROOTFS_INITRAMFS=y
# as long it's not possible to install package in initramfs,
# we provide this package here
CONFIG_PACKAGE_iperf=y
EOF

make defconfig && make -j "$CPUS"
