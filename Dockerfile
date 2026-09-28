FROM debian:11.11
LABEL maintainer="lotusnoir"

ENV container=docker
ENV LC_ALL=C
ENV DEBIAN_FRONTEND=noninteractive

# Bullseye is EOL: use the archive for main + updates.
# NOTE: debian-security for bullseye is not yet published on archive.debian.org
# (only up to buster as of now) — re-add it once Debian publishes it there.
RUN echo "deb http://archive.debian.org/debian bullseye main contrib non-free" > /etc/apt/sources.list \
    && echo "deb http://archive.debian.org/debian bullseye-updates main contrib non-free" >> /etc/apt/sources.list \
    && echo 'Acquire::Check-Valid-Until "false";' > /etc/apt/apt.conf.d/99no-check-valid-until

RUN apt-get update \
    && apt-get install -y --no-install-recommends --allow-downgrades \
        perl-base/bullseye \
        libsystemd0/bullseye \
        git locales systemd systemd-sysv sudo python3 python3-apt python3-pip iproute2 net-tools procps wget ca-certificates curl vim \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc /usr/share/man \
    && apt-get clean

RUN sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && \
    dpkg-reconfigure --frontend=noninteractive locales && \
    update-locale LANG=en_US.UTF-8

ENV LANG=en_US.UTF-8 
ENV LC_ALL=en_US.UTF-8
ENV LANGUAGE=en_US:en

RUN python3 -m pip install --no-cache-dir --upgrade pip \
    && python3 -m pip install --no-cache-dir ansible cryptography jmespath

RUN wget -q -O /usr/local/bin/goss https://github.com/aelsabbahy/goss/releases/download/v0.4.8/goss-linux-amd64 && chmod +x /usr/local/bin/goss

RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc /usr/share/man \
    && rm -f /lib/systemd/system/multi-user.target.wants/* \
    /etc/systemd/system/*.wants/* \
    /lib/systemd/system/local-fs.target.wants/* \
    /lib/systemd/system/sockets.target.wants/*udev* \
    /lib/systemd/system/sockets.target.wants/*initctl* \
    /lib/systemd/system/sysinit.target.wants/systemd-tmpfiles-setup* \
    /lib/systemd/system/systemd-update-utmp*

VOLUME [ "/tmp", "/run", "/run/lock" ]
ENTRYPOINT ["/lib/systemd/systemd"]
