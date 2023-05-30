# Linux SD Card Format for Swift Recorders

## Summary

This document describes using the Linux CLI command `mkdosfs` to format SD cards for use in Swift recorders. The recommended format is FAT32 with 64 KB cluster size.

## Format

When using `mkdosfs` you specify the sector size rather than the cluster size. A sector size of 128 clusters corresponds to a cluster size of 64 KB.

**Command:**
`$ sudo mkdosfs /dev/sda1 -s 128 -F 32 -I`

## Inspect

**Command:**
`$ sudo dosfsck -v -n /dev/sda1`

**Example output**

If you formatted the SD card successfully, the above command should generate the following output. Note that 65536 bytes is 64 KB, the desired cluster size.

```
fsck.fat 4.2 (2021-01-31)
Checking we can access the last sector of the filesystem
Boot sector contents:
System ID "mkfs.fat"
Media byte 0xf8 (hard disk)
      512 bytes per logical sector
    65536 bytes per cluster
      128 reserved sectors
First FAT starts at byte 65536 (sector 128)
        2 FATs, 32 bit entries
  7864320 bytes per FAT (= 15360 sectors)
Root directory start at cluster 2 (arbitrary size)
Data area starts at byte 15794176 (sector 30848)
  1950750 data clusters (127844352000 bytes)
63 sectors/track, 255 heads
     2048 hidden sectors
249726960 sectors total
Checking for unused clusters.
Checking free cluster summary.
/dev/sda1: 0 files, 1/1950750 clusters
```


## Reference:

[https://www.birds.cornell.edu/ccb/wp-content/uploads/2016/09/SWIFT-SD-Card-Formatting-Protocol.pdf](https://www.birds.cornell.edu/ccb/wp-content/uploads/2016/09/SWIFT-SD-Card-Formatting-Protocol.pdf)

[https://askubuntu.com/questions/190030/formatting-a-drive-to-fat32-with-mkdosfs-need-some-info](https://askubuntu.com/questions/190030/formatting-a-drive-to-fat32-with-mkdosfs-need-some-info)

[https://askubuntu.com/questions/1231020/how-to-consult-fat32-cluster-size-on-ubuntu](https://askubuntu.com/questions/1231020/how-to-consult-fat32-cluster-size-on-ubuntu)

[https://en.wikipedia.org/wiki/Disk_sector#Sectors_versus_clusters](https://en.wikipedia.org/wiki/Disk_sector#Sectors_versus_clusters)

