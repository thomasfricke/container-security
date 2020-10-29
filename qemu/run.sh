#!/bin/sh
exec qemu-system-i386  -cpu pentium -vga cirrus -hda disc.qcow -boot c -soundhw sb16 -soundhw pcspk -netdev user,id=mynet0 -device pcnet,netdev=mynet0 -vnc 0.0.0.0:0 -k $KEYBOARD -usb -device usb-tablet
