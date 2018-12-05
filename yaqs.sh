#!/bin/sh

# Yet Another QEMU Script v0.1

name=netbsd8
arch=x86_64
cpu=2
ram=2048
disk=netbsd8.qcow2
media=NetBSD-8.0-amd64.iso
nic=e1000
netid=mynet0
qs=qemu-system-
perm=/usr/bin/doas

${perm} ${qs}${arch} \
	-smp ${cpu} -m ${ram} \
	-hda ${disk} -cdrom ${media} \
	-netdev user,id=${netid},hostfwd=tcp:127.0.0.1:7922-:22 \
	-device ${nic},netdev=${netid}
