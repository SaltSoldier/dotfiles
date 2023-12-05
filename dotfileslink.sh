# 初めからあるファイルを削除
rm -f ~/.zshrc
rm -f ~/.vimrc
rm -f ~/.tmux.conf
rm -f ~/.gitconfig
rm -f ~/.tigrc
rm -rf ~/.vim
rm -rf ~/.config/nvim
rm -rf ~/.tmux

# ディレクトリ生成
mkdir ~/.vim
mkdir ~/.vim/dein
mkdir ~/.config
mkdir ~/.config/nvim

# .dotfiles内のエイリアス貼り付け
ln -sh ~/.dotfiles/zsh/.zshrc ~/.zshrc
ln -sh ~/.dotfiles/vim/.vimrc ~/.vimrc
ln -sh ~/.dotfiles/tmux/.tmux.conf ~/.tmux.conf
ln -sh ~/.dotfiles/git/.gitconfig ~/.gitconfig
ln -sh ~/.dotfiles/tig/.tigrc ~/.tigrc
ln -sh ~/.dotfiles/vim/.vimrc-neocomplete ~/.vim/.vimrc-neocomplete
ln -sh ~/.dotfiles/dein/dein.toml ~/.vim/dein/dein.toml
ln -sh ~/.dotfiles/nvim/init.vim ~/.config/nvim/init.vim
ln -sh ~/.dotfiles/python/.pythonstartup ~/.pythonstartup
#ln -sh ~/.dotfiles/tmux/tmux-pane-border /usr/local/bin/ # tmuxでgitのブランチ名を表示するためのソース

# deinのインストール
sh ~/dotfiles/dein/installer.sh ~/.vim/dein

# tmuxプラグインマネージャーのtpmをクローン
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
