# mount_hd

This is a small script to mount a raspi image to a folder quickly

### Usage to mount device
DEVICE should equal /dev/mmcblk0 or /dev/sdb or sd* 

SD_MOUNT should equal some empty folder. The script will fill the empty folder with two folders

```
sudo ./mount_hd.sh DEVICE SD_MOUNT
```
Usage to detach device
```
sudo ./mount_hd.sh detach SD_MOUNT
```
