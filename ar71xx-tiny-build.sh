#!/bin/bash

set -e

[ -z "$CPUS" ] && CPUS="$(nproc)"

cat >.config <<EOF
CONFIG_TARGET_ar71xx=y
CONFIG_TARGET_ar71xx_tiny=y
CONFIG_TARGET_MULTI_PROFILE=y
CONFIG_TARGET_DEVICE_ar71xx_tiny_DEVICE_tl-wr841-v9=y
CONFIG_DEVEL=y
CONFIG_BUILD_LOG=y
CONFIG_TARGET_INITRAMFS_COMPRESSION_LZMA=y
CONFIG_TARGET_ROOTFS_INITRAMFS=y
# as long it's not possible to install package in initramfs,
# we provide this package here
CONFIG_PACKAGE_iperf=y
EOF

make defconfig && make -j "$CPUS"
