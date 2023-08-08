FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

ENV TERM xterm

RUN apt-get update && apt-get install -y \
    apt-utils \
    wget \
    ca-certificates \
    lsb-release

# Download dan instal Hestia Control Panel
RUN wget https://raw.githubusercontent.com/hestiacp/hestiacp/release/install/hst-install.sh
RUN chmod +x hst-install.sh
RUN ./hst-install.sh 2>&1 | tee install.log

EXPOSE 8083

CMD ["/usr/local/hestia/bin/vst-nginx", "restart"]
