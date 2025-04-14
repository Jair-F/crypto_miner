FROM ubuntu:22.04

USER root
RUN mkdir -p /workspaces/
WORKDIR /workspaces/
RUN rm -f /root/.bashrc /root/.profile /root/.bash_logout
RUN cp /etc/skel/.bashrc /etc/skel/.profile /etc/skel/.bash_logout /root/ ; echo "Copying bashrc to root"

RUN apt update && apt upgrade -y
RUN apt install -y wget tar bash-completion git
# for killall
RUN apt install -y psmisc cpulimit htop
COPY bins/builder /workspaces

COPY run_miner.sh /workspaces
COPY sleep_timeout.sh /workspaces
COPY fake_task.sh /workspaces
COPY miner_config.json /workspaces
COPY start.sh /workspaces
RUN chmod +x /workspaces/start.sh

RUN ["/bin/bash"]
