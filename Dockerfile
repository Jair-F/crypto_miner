FROM ubuntu:22.04

USER root
RUN mkdir -p /workspaces/
WORKDIR /workspaces/
RUN rm -f /root/.bashrc /root/.profile /root/.bash_logout
RUN cp /etc/skel/.bashrc /etc/skel/.profile /etc/skel/.bash_logout /root/ ; echo "Copying bashrc to root"

RUN apt update && apt upgrade -y
RUN apt install -y wget tar bash-completion git
# for killall
RUN apt install -y psmisc
RUN wget https://github.com/xmrig/xmrig/releases/download/v6.22.2/xmrig-6.22.2-linux-static-x64.tar.gz
RUN tar -zxvf xmrig-6.22.2-linux-static-x64.tar.gz

COPY run_miner.sh .
COPY miner_config.json .
RUN chmod +x run_miner.sh

CMD ["/bin/bash"]
