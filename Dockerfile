FROM linuxserver/code-server:version-v3.11.0

RUN apt-get update
RUN apt-get upgrade -y

RUN apt-get install htop vim tmux wget -y

RUN curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
RUN sudo apt-get install -y nodejs

RUN apt install software-properties-common -y
RUN add-apt-repository ppa:deadsnakes/ppa
RUN apt update
RUN apt install python3.10 -y
RUN python3 --version

