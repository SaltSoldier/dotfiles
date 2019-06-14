# 初めからあるファイルを削除
rm ~/.vimrc
rm ~/.tmux.conf
rm -rf ~/.vim
rm -rf ~/.config/nvim

# ディレクトリ生成
mkdir ~/.vim
mkdir ~/.vim/dein
mkdir ~/.config
mkdir ~/.config/nvim

# .dotfiles内のエイリアス貼り付け
ln -sh ~/.dotfiles/vim/.vimrc ~/.vimrc
ln -sh ~/.dotfiles/tmux/.tmux.conf ~/.tmux.conf
ln -sh ~/.dotfiles/vim/.vimrc-neocomplete ~/.vim/.vimrc-neocomplete
ln -sh ~/.dotfiles/nvim/init.vim ~/.config/nvim/init.vim
ln -sh ~/.dotfiles/git/.gitconfig ~/.gitconfig
ln -sh ~/.dotfiles/dein/dein.toml ~/.vim/dein/dein.toml

# deinのインストール
sh ~/.dotfiles/dein/installer.sh ~/.vim/dein
