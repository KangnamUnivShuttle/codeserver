FROM linuxserver/code-server:version-v3.11.0

RUN apt-get update
RUN apt-get upgrade -y

RUN apt-get install htop vim tmux wget -y

RUN curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
RUN sudo apt-get install -y nodejs

RUN apt-get install libssl-dev openssl -y
RUN wget https://www.python.org/ftp/python/3.9.9/Python-3.9.9.tar.xz
RUN tar xzvf Python-3.9.9.tgz
WORKDIR ./Python-3.9.9
RUN ./configure
RUN make
RUN make install
RUN ln -fs ./Python /usr/bin/python
RUN python --version

WORKDIR ../
