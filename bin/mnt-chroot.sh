#!/bin/bash

scriptname=$(basename "$0")
unmount=0

error() {
   >&2 echo $@
}

printUsage() {
  cat <<EOM
  Usage: $scriptname /mount/point root=/root/device [subdir=/subdir/device]

     Example:
              $scriptname /mnt root=/dev/sdf2 boot=/dev/sdf1 mnt/user=/dev/sdf3

                  /mnt            = Root partition (/dev/sdf2)
                  /mnt/boot       = Boot partition (/dev/sdf1)
                  /mnt/mnt/user   = mnt/user partition (dev/sdf3)
EOM
}

# Mount dir and handle error
mountDir() {
  local dev=$1
  local dir=$2
  sudo mount $dev $dir
  [ $? -ne 0 ] && { error "Error mounting '$dev'."; return 1; }
  return 0
}

# unmount all dirs from current device index
unmountAll() {
  local count=$1
  local i
  unmountSpecialDirs
  for (( i=count; i>=0; i-- )); do
    sudo umount $rootdir/${subdir[$i]}
  done
  sudo umount $rootdir
}

# Mount special dirs
mountSpecialDirs() {
  sudo mount --bind /dev $rootdir/dev
  sudo mount --bind /dev/pts $rootdir/dev/pts
  sudo mount --bind /proc $rootdir/proc
  sudo mount --bind /sys $rootdir/sys
}

# unmount special dirs
unmountSpecialDirs() {
  sudo umount $rootdir/sys
  sudo umount $rootdir/proc
  sudo umount $rootdir/dev/pts
  sudo umount $rootdir/dev
}


rootdir="$1" && shift
[ ! -d "$rootdir" ] && { error "Target directory must exists: '$rootdir'."; exit 1; }

subdir=()
device=()
i=0

while [ ! -z "$1" ]; do

  case $1 in
    -u|+-help) unmount=1 ;;

    -h|--help) printUsage ;;

    *)
      tmpdir=${1%=*}
      tmpdev=${1#*=}

      if [ "$tmpdir" == "root" ]; then
        rootdev=$tmpdev
      else
        subdir[$i]="$tmpdir"
        device[$i]="$tmpdev"
        #[ ! -e "$rootdir/${subdir[$i]}" ] && error "Subdirectory does not exists: '$rootdir/$subdir'." && exit 1
      fi

      [ ! -e "$tmpdev" ] && { error "Device '$tmpdev' does not exists."; exit 1; }
      ;;
  esac

  (( i++ ))
  shift

done

[ $unmount -ne 0 ] && { unmountAll; exit 0; }

mountDir $rootdev $rootdir
[ $? -ne 0 ] && { error "Error mounting '$rootdev' at '$rootdir'."; exit 1; }

count=${#subdir[$@]}
for (( i=0; i<$count; i++ )); do

  mountDir ${device[$i]} ${subdir[$i]}
  # On error, unmount all devices and exit...
  [ $? -ne 0 ] && { unmountAll $i && exit 1; }

done

# Mount special dirs
mountSpecialDirs

cat << EOM
  To chroot in the mounted environment:
   $ sudo chroot $rootdir

EOM

