build: fs/EFI/BOOT/BOOTX64.EFI

fs/EFI/BOOT/BOOTX64.EFI: main.c
	mkdir -p fs/EFI/BOOT
	x86_64-w64-mingw32-gcc -Wall -Wextra -e efi_main -nostdinc -nostdlib \
	-fno-builtin -Wl,--subsystem,10 -o $@ $<

img:;
	qemu-img create -f raw disk.img 200M
	mkfs.fat -n 'UEFI_TEST' -s 2 -f 2 -R 32 -F 32 disk.img
	mkdir -p mnt
	sudo mount -o loop disk.img mnt
	sudo mkdir -p mnt/EFI/BOOT
	sudo cp fs/EFI/BOOT/BOOTX64.EFI mnt/EFI/BOOT/BOOTX64.EFI
	sudo umount mnt

run: fs/EFI/BOOT/BOOTX64.EFI
	qemu-system-x86_64 -bios /usr/share/ovmf/OVMF.fd -hda disk.img

clean:
	rm -rf *~ fs mnt

.PHONY: clean