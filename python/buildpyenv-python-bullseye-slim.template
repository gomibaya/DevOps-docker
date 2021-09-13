#!/bin/bash
#echo "Instalar paquetes dev para pyenv"
#apt-get install -y --no-install-recommends \
#        build-essential \
#        libssl-dev \
#        zlib1g-dev \
#        libbz2-dev \
#        libreadline-dev \
#        libsqlite3-dev \
#        libncurses5-dev \
#        libncursesw5-dev \
#        tk-dev \
#        libffi-dev \
#        liblzma-dev \
#        ;
# install pyenv
cd /home/pythondev/
mkdir -p /home/pythondev/git
curl https://pyenv.run | bash
# Install versiones python
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
pyenv install 3.6.15
pyenv install 3.7.12
pyenv install 3.8.12
pyenv install 3.9.7
pyenv global 3.6.15 3.7.12 3.8.12 3.9.7

#apt purge -y \
#        build-essential \
#        libssl-dev \
#        zlib1g-dev \
#        libbz2-dev \
#        libreadline-dev \
#        libsqlite3-dev \
#        libncurses5-dev \
#        libncursesw5-dev \
#        tk-dev \
#        libffi-dev \
#        liblzma-dev \
#        ;
#apt autoremove