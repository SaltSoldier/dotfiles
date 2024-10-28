# パス設定
export PATH="/usr/local/mysql/bin:$PATH"
export PATH="/usr/local/bin:$PATH"
export PERCOL="fzf"
export PATH="/usr/local/Cellar/openssl/1.0.2s/bin:$PATH"
export PATH="/usr/local/opt/mysql-client@8.0/bin:$PATH"

# 文字化けの対処
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# エイリアス設定
# vimコマンドでNeoVimを起動
alias vim='nvim'
# git系
alias gca='git commit --amend'
alias gpo='git push origin'
alias gpfo='git push -f origin'
alias grh='git reset --hard'
alias gm='git merge'
alias gmom='git merge origin/master'
alias gf='git fetch'
# tig系
alias ti='tig --all'
alias ti='tig --all'
# unix系
alias hg='history 1 | grep'

# カレントディレクトリを表示
PS1="%{$fg[cyan]%}[${USER}@${HOST%%.*} %1~]%(!.#.$)${reset_color} "

# 履歴ファイルの保存先
export HISTFILE=${HOME}/.zsh_history

# メモリに保存される履歴の件数
export HISTSIZE=1000

# 履歴ファイルに保存される履歴の件数
export SAVEHIST=100000

# 色設定
autoload -Uz colors
colors
PROMPT=$'%{\e[38;5;050m%}[%n@%m]%{\e[0m%}%{\e[38;5;226m%}/%C%{\e[0m%} '

# 重複を記録しない
setopt hist_ignore_dups
# 履歴中の重複行をファイル記録前に無くす
setopt hist_ignore_all_dups
# 行頭がスペースのコマンドは記録しない
setopt hist_ignore_space
# 履歴検索中、(連続してなくとも)重複を飛ばす
setopt hist_find_no_dups
# 余分な空白は詰めて記録
setopt hist_reduce_blanks
# histroyコマンドは記録しない
setopt hist_no_store
# ヒストリを呼び出してから実行する間に一旦編集可能
setopt hist_verify

# コマンド補完反映
autoload -U compinit
compinit

## tmux のパイプラインにgitのブランチ名を表示するための関数
#function precmd() {
#  if [ ! -z $TMUX ]; then
#    tmux refresh-client -S
#  fi
#}

# 端末起動時にtmuxを起動
if [[ ! -n $TMUX && $- == *l* ]]; then
  # get the IDs
  ID="`tmux list-sessions`"
  if [[ -z "$ID" ]]; then
    tmux new-session
  fi
  create_new_session="Create New Session"
  ID="$ID\n${create_new_session}:"
  ID="`echo $ID | $PERCOL | cut -d: -f1`"
  if [[ "$ID" = "${create_new_session}" ]]; then
    tmux new-session
  elif [[ -n "$ID" ]]; then
    tmux attach-session -t "$ID"
  else
    :  # Start terminal normally
  fi
fi

# pyenv setting
# export PYENV_ROOT="$HOME/.pyenv"
# export PATH="$PYENV_ROOT/bin:$PATH"
# eval "$(pyenv init --path)"
# if command -v pyenv 1>/dev/null 2>&1; then
#   eval "$(pyenv init -)"
# fi

# javaのバージョン指定コマンド追加
jdk() {
        version=$1
        export JAVA_HOME=$(/usr/libexec/java_home -v "$version");
        java -version
 }

# pythonstartup
export PYTHONSTARTUP=~/.pythonstartup

# ruby setup
# [[ -d ~/.rbenv  ]] && \
#   export PATH=${HOME}/.rbenv/bin:${PATH} && \
#   eval "$(rbenv init -)"
# source $(brew --prefix nvm)/nvm.sh

# direnv
export EDITOR=vim
eval "$(direnv hook zsh)"


# terraformでたまにコマンドが失敗する対処方法
# export GODEBUG=asyncpreemptoff=1
# eval "$(anyenv init -)"

# glod表現を許容する
setopt nomatch

# poetryパス追加
export PATH="$HOME/.local/bin:$PATH"
source "$HOME/.rye/env"

# PATH優先順位の調整
export PATH="$HOME/generativex/pj-aipc/.venv/bin:$PATH"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
