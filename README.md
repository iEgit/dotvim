dotvim
======
My vim config

```sh
git clone https://github.com/iEgit/dotvim
mv ~/dotvim ~/.vim
cd ~/.vim
git submodule init
git submodule update --recursive

" rename or remove current vimrc if it exists"
ln -s ~/dotvim/.vimrc ~/.vimrc
```
