#!/bin/sh

#check for root
if ! [ $(id -u) = 0 ]; then
  echo "Please run as root"
  exit 1
fi

#check for device
if [ -z "$1" ]; then
  echo "usage is ./mount_hd.sh /dev/DEVICE MOUNT_POINT"
  exit 1
fi

DEVICE=$1
MNT_POINT=$2
#check for proper directories.
FAT32=$MNT_POINT/fat32
EXT4=$MNT_POINT/ext4

#check for unmount command
if [ $DEVICE = "detach" ]; then
  echo "Unmounting drives"
  umount $FAT32
  umount $EXT4
  echo "All Done!"
  exit 0
fi

#check device directory
if [ ! -d $FAT32 ]; then
  echo "fat32 directory does not exist creating it"
  mkdir $FAT32
fi

if [ ! -d $EXT4 ]; then
  echo "ext4 directory doesn not exist creating it"
  mkdir $EXT4
fi

echo "I hope your device has two partitions"
P0="p1"
P1="p2"
# If the device is not mmcblk then its sdb because thats all that exists on my machine
if [ ! -d $DEVICE$P0 ]; then
  P0="1"
  P1="2"
fi

mount $DEVICE$P0 $FAT32
mount $DEVICE$P1 $EXT4
echo "All Done!"
exit 0
