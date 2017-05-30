#!/bin/bash

# setup prompt
echo "PS1='\n[\u@\h:\w \D{%a %H:%M:%S} \j $?]\n$'" >> .bashrc

# setup git
git config --global user.name "Chris Cornelison"
git config --global user.email "chris.cornelison@pioneer.com"

# upgrade and configure Vim 8.0
sudo add-apt-repository -y ppa:jonathonf/vim
sudo apt -y update
sudo apt -y install vim
git clone --recursive https://github.com/chriscnc/dotfiles.git
ln -s dotfiles/vim .vim
ln -s dotfiles/vimrc .vimrc

# install misc utilities
sudo apt -y install tree awscli

# JDK 8
sudo apt -y install openjdk-8-jdk-headless

# Maven
sudo apt -y install maven

# Spark
wget https://d3kbcqa49mib13.cloudfront.net/spark-2.1.1-bin-hadoop2.7.tgz
sudo tar zxvf spark-2.1.1-bin-hadoop2.7.tgz -C /opt
sudo ln -fs spark-2.1.1-bin-hadoop2.7 /opt/spark
echo '# Spark' >> .bashrc
echo 'export SPARK_HOME=/opt/spark' >> .bashrc
echo 'export PATH=$PATH:$SPARK_HOME/bin' >> .bashrc

# Avrotools
sudo wget -P /opt http://www.us.apache.org/dist/avro/avro-1.7.7/java/avro-tools-1.7.7.jar
echo '#!/bin/bash' >> avrotools
echo 'java -jar /opt/avro-tools-1.7.7.jar $@' >> avrotools
sudo mv avrotools /usr/local/bin/
sudo chmod +x /usr/local/bin/avrotools

# install Pyenv
sudo apt -y install make build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev xz-utils
git clone https://github.com/pyenv/pyenv.git ~/.pyenv
echo "# PyEnv" >> .bashrc
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> .bashrc
echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> .bashrc
echo 'eval "$(pyenv init -)"' >> ~/.bashrc
git clone https://github.com/pyenv/pyenv-virtualenv.git .pyenv/plugins/pyenv-virtualenv
echo 'eval "$(pyenv virtualenv-init -)"' >> .bashrc 
pyenv install 3.6.1
pyenv global 3.6.1


