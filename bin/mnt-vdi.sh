#!/bin/bash
#
# Script to mount a virtual disk image
# Needs nbd kernel module and qemu-nbd tool installed
#
# Usage:
# 	mnt-vdi.sh [options] <virtual disk file> [mount point]
#		[options]:
#			-p N	Specify partition number N, starting at 1 (Default=1)
#			-n      Specify no-cache option for qemu-nbd
#			-d DEV	Remove device DEV.
#
#	Ex.
#		mnt-vdi.sh -p 2 /path/to/virtualdrive.vdi /path/to/mount/directory/
#		mnt-vdi.sh -d /dev/nbd0
#
# Author: Maxime langlois
#

echoerr() { echo "$@" >&2; }

printUsage() {
cat << EOM
Script to mount a virtual disk image.
Requires nbd kernel module and qemu-nbd tool installed.

Usage:
	mnt-vdi.sh [options] [virtual disk file] [mount point]
		[options]:
			-p N	Specify partition number N, starting at 1 (Default=1)
			-d DEV	Remove device DEV.

	Ex:
		mnt-vdi.sh -p 2 /path/to/virtualdrive.vdi /path/to/mount/directory/
		mnt-vdi.sh -d /dev/nbd0

 Author: Maxime langlois

EOM
}

NBDARGS=""
PARTNUM=0

while [ "$1" != "" ]
do
  case $1 in
    -p)
      [ $2 -eq 0 ] && echoerr "Can't use partition number 0." && exit 1
      PARTNUM=$2
      NBDARGS="$NBDARGS -P $PARTNUM"
      shift
      shift ;;
    -n)
      NBDARGS="$NBDARGS -n"
      shift ;;
    -d)
      [ ! -e "$2" ] && echoerr "Can't find device $2." && exit 1
      sudo qemu-nbd -d $2
      exit 0 ;;
    -h|--help)
      printUsage
      exit 0 ;;
    *)
      [ -f "$1" ] && VIRTUAL_DISK=$1 && shift && continue
      [ -d "$1" ] && MOUNT_POINT=$1 && shift && continue
    ;;
  esac
done

[ "$VIRTUAL_DISK" == "" ] && printUsage && exit 1

# Check if nbd module is loaded, else load it
[ -z "$(lsmod | grep nbd)" ] && sudo modprobe nbd max_part=16

# Get first available nbd device
# (find first nbd device that has no associated partitions)
for i in {0..16}
do
  [ ! -e /dev/nbd${i} ] && echoerr "Could not find an available nbd device." && exit 1
  [ -z "$(find /dev/ -name nbd${i}p*)" ] && NBDDEV="/dev/nbd${i}" && break
done

# Load vdi image
sudo qemu-nbd $NBDARGS -c $NBDDEV $VIRTUAL_DISK
[ $? -ne 0 ] && echoerr "Failed loading disk image on $NBDDEV." && exit 1

echo "Loaded disk image on $NBDDEV"
[ "$MOUNT_POINT" == "" ] && ls -la ${NBDDEV}* && exit 0
[ $PARTNUM -eq 0 ] && ls -la ${NBDDEV}* && exit 0

# Mount partition
#sudo mount -o loop ${NBDDEV}p${PARTNUM} $MOUNT_POINT
sudo mount -o loop $NBDDEV $MOUNT_POINT
[ $? -ne 0 ] && echoerr "Failed mounting partition ${NBDDEV}p${PARTNUM} on $MOUNT_POINT." && exit 1

echo "Partition $PARTNUM of $VIRTUAL_DISK disk image mounted at '$MOUNT_POINT'."
exit 0

