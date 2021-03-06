# machines

### TODO

* `/etc/systemd/coredump.conf`

### Docker

```
pacman -Sy ansible make
```

### Simple UFI Machine

```shell
# verify UFI boot

% ls /sys/firmware/efi/efivars

# setup disk

% parted /dev/sda mklabel gpt

# UFI part

% parted /dev/sda mkpart P1 fat32 2048s 256Mib
% parted /dev/sda toggle 1 esp
% mkfs.fat -F32 /dev/sdx1

# system part

% parted /dev/sda mkpart P2 ext4 256MiB 100%
% mkfs.ext4 -L root /dev/sda2

# mount

% mount /dev/disk/by-label/root /mnt
% mkdir /mnt/boot
% mount /dev/sda1 /mnt/boot

# choose mirror in /etc/pacman.d/mirrorlist

# bootstrap

% pacstrap /mnt base grub efibootmgr git ansible make
% genfstab -L /mnt >> /mnt/etc/fstab
% arch-chroot /mnt
% git clone https://github.com/shanegibbs/machines.git
% grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB
% grub-mkconfig -o /boot/grub/grub.cfg

# set root password

% passwd
```
