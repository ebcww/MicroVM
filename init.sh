#!/bin/bash
mkdir -p /home/$USER/.ssh/
mkdir -p /etc/polkit-1/localauthority/50-local.d/
printf "[Remote libvirt SSH access]\nIdentity=unix-group:libvirt\nAction=org.libvirt.unix.manage\nResultAny=yes\nResultInactive=yes\nResultActive=yes" > /etc/polkit-1/localauthority/50-local.d/50-libvirt-ssh-remote-access-policy.pkla
echo "Generating User Password"
readonly password=$(dd if=/dev/urandom bs=12 count=1 | base64)
yes $password | adduser $USER &> /dev/null
addgroup $USER libvirt
echo $SSH_AUTHORIZED_KEYS > /home/$USER/.ssh/authorized_keys
chmod 600 /home/$USER/.ssh/authorized_keys
chown $USER:$USER -R /home/$USER
#echo user = "root" >> /etc/libvirt/qemu.conf
#echo group = "root" >> /etc/libvirt/qemu.conf


/usr/sbin/sshd -D &
service polkit start &> /dev/null
#Silencing annoying polkit errors
libvirtd &
virtnetworkd &
virtqemud &
virtstoraged &
virtnodevd &
virtproxyd &
virt-host-validate
echo ""
echo "----------- ATTENTION -----------"
echo "You can now login with the user: $USER"
echo "With the temporary password: $password"
echo "Or Using SSH_PUBLIC_KEY: $SSH_AUTHORIZED_KEYS"
echo "---------------------------------"
echo ""
virtlogd
