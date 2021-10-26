FROM debian:bullseye

LABEL maintainer="lotusnoir"

ARG DEBIAN_FRONTEND=noninteractive

ENV container docker

RUN apt-get update ; \
    apt-get install -y --no-install-recommends systemd systemd-sysv python3 sudo gnupg python3-apt ;\
    apt-get clean && rm -rf /var/lib/apt/lists/* ;\
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* ;\
    rm -rf /lib/systemd/system/multi-user.target.wants/* ;\
    rm -rf /etc/systemd/system/*.wants/* ;\
    rm -rf /lib/systemd/system/local-fs.target.wants/* ;\
    rm -rf /lib/systemd/system/sockets.target.wants/*udev* ;\
    rm -rf /lib/systemd/system/sockets.target.wants/*initctl* ;\
    rm -rf /lib/systemd/system/sysinit.target.wants/systemd-tmpfiles-setup* ;\
    rm -rf /lib/systemd/system/systemd-update-utmp*

VOLUME [ "/sys/fs/cgroup" ]
CMD ["/lib/systemd/systemd"]
