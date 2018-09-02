dotvim
======
My vim config

```sh
git clone https://github.com/iEgit/dotvim
mv ~/dotvim ~/.vim
cd ~/.vim
git submodule update --init

" rename or remove current vimrc if it exists"
ln -s ~/dotvim/.vimrc ~/.vimrc
```

one line
```sh
git clone https://github.com/iEgit/dotvim ~/.vim && cd ~/.vim && git submodule update --init --recursive && ln -s  ~/.vim/.vimrc ~/.vimrc && cd -
```

install YouCompleteMe
```sh
~/.vim/bundle/YouCompleteMe/install.py
```
