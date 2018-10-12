#!/usr/bin/env bash

apt update
apt install -yq python3 bash locales rsync curl

apt install -yq git-core gcc make zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev libssl-dev

curl -L https://github.com/pyenv/pyenv-installer/raw/master/bin/pyenv-installer | bash
echo 'export PATH="/root/.pyenv/bin:$PATH"' >> $HOME/.bash_profile
echo 'eval "$(pyenv init -)"' >> $HOME/.bash_profile
echo 'eval "$(pyenv virtualenv-init -)"' >> $HOME/.bash_profile
echo "export LC_ALL=C.UTF-8" >> $HOME/.bash_profile
echo "export LANG=C.UTF-8" >> $HOME/.bash_profile

export PATH="/root/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
pyenv install 3.6.6
pyenv global 3.6.6
