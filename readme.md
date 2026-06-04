To run a the latest version run  docker run -it -p 8022:8022 --pid=host -v /dev/kvm:/dev/kvm -v /dev/net/tun:/dev/net/tun ghcr.io/ebcww/microvm-container:latest'
To access container set the SSH_AUTHORIZED_KEYS env variable
docker compose is the only supported method of using this container
