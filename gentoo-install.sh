parted --script -a optimal /dev/sda \
mklabel gpt \
unit mib \
mkpart primary 1 3 \
name 1 grub \
set 1 bios_grub on \
mkpart primary 3 131 \
name 2 boot \
mkpart primary 131 1155 \
name 3 swap \
mkpart primary 1155 65155 \
name 4 rootfs \
set 2 boot on \
q \

mkfs.ext4 /dev/sda1

mkfs.ext4 /dev/sda2

mkfs.btrfs /dev/sda3
mkswap /dev/sda3
swapon/dev/sda3

mkfs.btrfs /dev/sda4

mount /dev/sda4 /mnt/gentoo
cd /mnt/gentoo
wget https://gentoo.osuosl.org/releases/amd64/autobuilds/current-stage3-amd64/stage3-amd64-20210127T214504Z.tar.xz

