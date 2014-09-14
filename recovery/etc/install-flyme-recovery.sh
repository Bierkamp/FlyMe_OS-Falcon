#!/system/bin/sh
if [ -f /system/etc/recovery-transform.sh ]; then
  exec sh /system/etc/recovery-transform.sh 11499520 f5823057b09bc5c89cb2c0f2ee4263f92ba0b440 9158656 53a3af0b253987f872dd124fb2d56b4cc5fcc8e6
fi

if ! applypatch -c EMMC:/dev/block/platform/msm_sdcc.1/by-name/recovery:11499520:f5823057b09bc5c89cb2c0f2ee4263f92ba0b440; then
  log -t recovery "Installing new recovery image"
  applypatch -b /system/etc/recovery-resource.dat EMMC:/dev/block/platform/msm_sdcc.1/by-name/boot:9158656:53a3af0b253987f872dd124fb2d56b4cc5fcc8e6 EMMC:/dev/block/platform/msm_sdcc.1/by-name/recovery f5823057b09bc5c89cb2c0f2ee4263f92ba0b440 11499520 53a3af0b253987f872dd124fb2d56b4cc5fcc8e6:/system/recovery-from-boot.p
else
  log -t recovery "Recovery image already installed"
fi
