
# clone vundle into vim
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
#also get pathogen
mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
ln -s $PWD/vimrc ~/.vimrc
ln -s $PWD/.zshrc ~/.zshrc
ln -s $PWD/p10k.zsh ~/.p10k.zsh

#install vundle plugins
vim +PluginInstall +qall
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
#instal antigen for zsh
curl -L git.io/antigen > $HOME/.antigen.zsh

