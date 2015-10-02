dotvim
======
My vim config

```sh
git clone https://github.com/iEgit/dotvim
mv ~/dotvim ~/.vim cd ~/.vim
git submodule update --init

" rename or remove current vimrc if it exists"
ln -s ~/dotvim/.vimrc ~/.vimrc

one line
`
git clone https://github.com/iEgit/dotvim ~/.vim && cd ~/.vim && git submodule update --init && ln -s  ~/.vim/.vimrc ~/.vimrc && cd -
`
