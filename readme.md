#Micro VM
Another unpriviliged rootless docker solution with libvirt HVM support with full kvm acceleration support. 
Following the unix philosophy of principal of least privilige. This container is proudly made without AI.

To run the latest version:
1. Add your user to the kvm group
* eg: usermod -a -G kvm $USER
2. docker run -it -p 8022:8022 --cap-add net_admin --pid=host -v /dev/kvm:/dev/kvm -v /dev/net/tun:/dev/net/tun ghcr.io/ebcww/microvm:latest
* To access container permanently set the SSH_AUTHORIZED_KEYS env variable
* make sure to bind the /etc/ssh,/etc/libvirt,/var/lib/libvirt/ directorys to save your vm's
* For network acceleration load the vhost-net module and bind the /dev/vhost-net device
* Currently rootless mode is the primary supported operation rootfull is untested
* Currently podman is not yet supported but will be supported in a future release. Currently podman's default seccomp profiles prevent rootless modifcations which allow users to create vnet interfaces
* docker compose is the primary supported method of using this container
