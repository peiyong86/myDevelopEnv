FROM ubuntu
MAINTAINER peiyong <peiyong86@gmail.com>
RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections
RUN apt-get update && apt-get install -y --no-install-recommends apt-utils
# install python and other basic libs
#RUN apt-get install -y python-software-properties
RUN apt-get install -y wget tree htop vim git 
RUN apt-get install -y build-essential
RUN apt-get install -y python-dev
# install zsh
RUN apt-get install zsh -y
RUN git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
RUN cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc
RUN chsh -s $(which zsh)
# install pip, ipython
RUN wget https://bootstrap.pypa.io/get-pip.py && python get-pip.py
RUN pip install ipython
# install fasd
RUN mkdir Libs && cd Libs && git clone https://github.com/clvv/fasd.git && cd fasd && make install
# get setup file
RUN git clone https://github.com/peiyong86/myDevelopEnv.git 
RUN cp myDevelopEnv/.vimrc ~
RUN cp myDevelopEnv/.zshrc ~
# install vim plugin
RUN git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
RUN vim +PluginInstall +qall
ENTRYPOINT bin/zsh
