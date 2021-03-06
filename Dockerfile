FROM ubuntu
MAINTAINER peiyong <peiyong86@gmail.com>
RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections
RUN locale-gen en_US.UTF-8
RUN apt-get update && apt-get install -y --no-install-recommends apt-utils
# install python and other basic libs
#RUN apt-get install -y python-software-properties
RUN apt-get install -y wget tree htop vim git 
RUN apt-get install -y build-essential cmake
RUN apt-get install -y python-dev
# install zsh
RUN apt-get install zsh -y
RUN git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
RUN cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc
RUN chsh -s $(which zsh)
# install pip, ipython
RUN wget https://bootstrap.pypa.io/get-pip.py && python get-pip.py
RUN pip install ipython
# install howdoi
RUN pip install howdoi
# install docopt
RUN pip install docopt
# install flake8
RUN python -m pip install flake8
# install fasd
RUN mkdir Libs && cd Libs && git clone https://github.com/clvv/fasd.git && cd fasd && make install
# install exuberant-ctags
RUN apt-get install -y exuberant-ctags
# get setup file
RUN git clone https://github.com/peiyong86/myDevelopEnv.git 
RUN cp myDevelopEnv/.vimrc_plugin_install ~/.vimrc
RUN cp myDevelopEnv/.zshrc ~
# install vim plugin
RUN git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
RUN vim +PluginInstall +qall
RUN cd ~/.vim/bundle/YouCompleteMe && python install.py --clang-completer
RUN mv /myDevelopEnv/python.snippets ~/.vim/bundle/vim-snippets/snippets
# copy vimrc file with settings
RUN cp /myDevelopEnv/.vimrc ~
ENTRYPOINT bin/zsh
