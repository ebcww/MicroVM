# Micro VM
Another unpriviliged rootless docker solution with libvirt HVM support with full kvm acceleration support. 
Following the unix philosophy of principal of least privilige.

To run a the latest version:
1. Add your user to the kvm group
2. docker run -it -p 8022:8022 --cap-add net_admin --pid=host -v /dev/kvm:/dev/kvm -v /dev/net/tun:/dev/net/tun ghcr.io/ebcww/microvm-container:latest
* To access container permanently set the SSH_AUTHORIZED_KEYS env variable
* make sure to bind the /etc/ssh,/etc/libvirt,/var/lib/libvirt/images directorys to save your vm's
* For network acceleration load the vhost-net module and bind the /dev/vhost-net device
* Currently rootless mode is the primary supported operation rootfull is untested
* docker compose is the primary supported method of using this container
