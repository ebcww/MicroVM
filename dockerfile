FROM alpine:latest
ENV USER="virt-admin"
RUN apk add --no-cache libvirt-daemon qemu-img qemu-system-x86_64 qemu-modules openrc polkit dbus openssh-server;echo "Port 8022" > /etc/ssh/sshd_config.d/50-access.conf;mkdir -p /run/openrc;mkdir /init;echo remember_owner = 0 >> /etc/libvirt/qemu.conf;touch /run/openrc/softlevel
COPY --chmod=100 ./init.sh /init
ENTRYPOINT ["/init/init.sh"]
