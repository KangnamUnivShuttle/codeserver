FROM linuxserver/code-server:4.0.1-focal

RUN apt-get update
RUN apt-get upgrade -y

RUN apt-get install htop vim tmux wget -y

RUN curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
RUN sudo apt-get install -y nodejs

RUN apt install software-properties-common -y
RUN add-apt-repository ppa:deadsnakes/ppa
RUN apt update
RUN apt install python3.10 -y

RUN alias python=python3.10
RUN alias pip=pip3

RUN apt install python3-pip python3.10-venv -y

RUN python3 --version

RUN apt-get install unzip -y

# RUN wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
# RUN dpkg -i google-chrome-stable_current_amd64.deb

# https://askubuntu.com/questions/79280/how-to-install-chrome-browser-properly-via-command-line

RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add - 
RUN sh -c 'echo "deb https://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
RUN apt-get update
RUN apt-get install google-chrome-stable -y

# RUN echo fs.inotify.max_user_watches=524288 | tee -a /etc/sysctl.conf && sudo sysctl -p
# RUN sysctl -w fs.inotify.max_user_watches=524288
RUN sysctl fs.inotify.max_user_watches=524288
RUN sysctl -p

RUN echo "fs.inotify.max_user_watches=524288" >> /etc/sysctl.conf

COPY ./sysctl.conf /etc/sysctl.conf
RUN sysctl -p

RUN echo fs.inotify.max_user_watches=524288 | tee -a /etc/sysctl.conf && sysctl -p

RUN cat /proc/sys/fs/inotify/max_user_watches

RUN apt install fonts-nanum-coding -y
