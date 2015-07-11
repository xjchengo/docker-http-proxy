FROM nginx
MAINTAINER Xujian Chen <xjchen@echo58.com>

# Use Reverse Proxy Config
COPY nginx.conf /etc/nginx/nginx.conf

# Install OpenSSH Server
RUN apt-get update && \
    apt-get -y install openssh-server pwgen supervisor && \
    mkdir -p /var/run/sshd

## Configure OpenSSH Server
RUN sed -i "s/PermitRootLogin .*/PermitRootLogin yes/g" /etc/ssh/sshd_config && \
    sed -i "s/UsePrivilegeSeparation.*/UsePrivilegeSeparation no/g" /etc/ssh/sshd_config

## Configure Supervisor
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

ADD run.sh /run.sh

CMD ["/run.sh"]

EXPOSE 22
