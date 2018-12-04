#!/bin/sh

# Yet Another QEMU Script v0.1

name=netbsd8
ram=2048
cpu=2
disk=netbsd8.img
media=netbsd.iso
qs=qemu-system-
arch=x86_6

${qs}${arch} \
	-smp ${cpu} -m ${ram} \
	-hda ${disk} -cdrom ${media} \
	-netdev user,id=mynet0,hostfwd=tcp:127.0.0.1:7922-:22 \
	-device e1000,netdev=mynet0 \
	${name} 
