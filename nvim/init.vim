set number

" ペースト系
" 保存行を最大1000行？
set viminfo='20,\"1000
" クリップボードにもコピー
set clipboard+=unnamed
" カーソル点滅
set guicursor=a:blinkon1

" USキーボード用コマンド
" ノーマルモード時だけ ; と : を入れ替える
nnoremap ; :
nnoremap : ;
nnoremap <C-b> <Left>
nnoremap <C-n> <Down>
nnoremap <C-p> <Up>
nnoremap <C-f> <Right>

inoremap <C-b> <Left>
inoremap <C-n> <Down>
inoremap <C-p> <Up>
inoremap <C-f> <Right>
inoremap <C-j> <ESC>


" スワップファイルを作らない
set noswapfile
" インデントはスマートインデント
set smartindent
" ファイル名の表示
set title
" 検索結果をハイライ表示
set hlsearch
"バックスペースを効かす
set backspace=indent,eol,start
"現在編集中のファイル名表示
set laststatus=2

" Tab系
" 不可視文字を可視化(タブが「>-」と表示される)
set list
set listchars=tab:>-,space:_
" Tab文字を半角スペースにする
set expandtab
" 行頭以外のTab文字の表示幅（スペースいくつ分）
set tabstop=4
" 行頭でのTab文字の表示幅
set shiftwidth=4
" 新しい行を開始したとき、新しい行のインデントを現在行と同じにする
set autoindent


if &compatible
  set nocompatible
endif

" dein.vimの指定"
set runtimepath+=$HOME/.vim/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('$HOME/.vim/dein')
  call dein#begin('$HOME/.vim/dein')
  " tomlファイルの読み込み
  call dein#load_toml('~/.vim/dein/dein.toml', {'lazy': 0})

  call dein#add('$HOME/.vim/dein')
  call dein#add('Shougo/neocomplete.vim')
  call dein#add('Shougo/neocomplcache-rsense.vim')
  call dein#add('Shougo/vimfiler')
  call dein#add('scrooloose/syntastic')
  " ファイルオープンを便利に
  call dein#add('Shougo/unite.vim')
  " Unite.vimで最近使ったファイルを表示できるようにする
  call dein#add('Shougo/neomru.vim')
  "railsのコマンドが打てる
  call dein#add('tpope/vim-rails')
  "rubyのendを自動挿入
  call dein#add('tpope/vim-endwise')
  "コメントアウトを手軽に行える(矩形を選択してCtrl+-)
  call dein#add('tomtom/tcomment_vim')
  "インデントを可視化"
  call dein#add('nathanaelkane/vim-indent-guides')
  " ログファイルを色づけしてくれる
  call dein#add('vim-scripts/AnsiEsc.vim')

  call dein#end()
  call dein#save_state()
endif

" neovim起動時に未インストールの場合はインストールする
if dein#check_install()
  call dein#install()
endif

if filereadable($HOME . "/.vim/.vimrc-neocomplete")
  source ~/.vim/.vimrc-neocomplete
endif

"" vimfiler
" ref. https://github.com/mizoki/dotfiles/blob/42c377ed5e003ac921f1874c5a62d04f8cf5301e/.vimrc#L675-L686
" Set vimfiler to default explorer
let g:vimfiler_as_default_explorer = 1
" Enable file operation commands
let g:vimfiler_safe_mode_by_default = 0
" Show cursor line only in vimfiler buffer
autocmd filetype vimfiler setlocal cursorline

let g:indent_guides_exclude_filetypes=['text', 'help', 'clojure', 'nerdtree', 'vimfiler', 'vimshell']

" -------------------------------
" Rsense
" -------------------------------
let g:rsenseHome = '/Users/ryoheishioji/.rbenv/shims/rsense'
let g:rsenseUseOmniFunc = 1

" --------------------------------
" neocomplete.vim
" --------------------------------
let g:acp_enableAtStartup = 0
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
if !exists('g:neocomplete#force_omni_input_patterns')
  let g:neocomplete#force_omni_input_patterns = {}
endif
let g:neocomplete#force_omni_input_patterns.ruby = '[^.*\t]\.\w*\|\h\w*::'


filetype plugin indent on
syntax enable

" auto reload .vimrc
augroup source-vimrc
  autocmd!
  autocmd BufWritePost *vimrc source $MYVIMRC | set foldmethod=marker
  autocmd BufWritePost *gvimrc if has('gui_running') source $MYGVIMRC
augroup END


" http://blog.remora.cx/2010/12/vim-ref-with-unite.html
""""""""""""""""""""""""""""""
" Unit.vimの設定
""""""""""""""""""""""""""""""
" バッファ一覧
noremap <C-P> :Unite buffer<CR>
" ファイル一覧
noremap <C-N> :Unite -buffer-name=file file<CR>
" 最近使ったファイルの一覧
noremap <C-Z> :Unite file_mru<CR>
" sourcesを「今開いているファイルのディレクトリ」とする
noremap :uff :<C-u>UniteWithBufferDir file -buffer-name=file<CR>
" ウィンドウを分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
" ウィンドウを縦に分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
au FileType unite inoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
" ESCキーを2回押すと終了する
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>
""""""""""""""""""""""""""""""

" http://inari.hatenablog.com/entry/2014/05/05/231307
""""""""""""""""""""""""""""""
" 全角スペースの表示
""""""""""""""""""""""""""""""
function! ZenkakuSpace()
    highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=darkgray
endfunction

if has('syntax')
    augroup ZenkakuSpace
        autocmd!
        autocmd ColorScheme * call ZenkakuSpace()
        autocmd VimEnter,WinEnter,BufRead * let w:m1=matchadd('ZenkakuSpace', '　')
    augroup END
    call ZenkakuSpace()
endif
""""""""""""""""""""""""""""""

" https://sites.google.com/site/fudist/Home/vim-nihongo-ban/-vimrc-sample
""""""""""""""""""""""""""""""
" 挿入モード時、ステータスラインの色を変更
""""""""""""""""""""""""""""""
let g:hi_insert = 'highlight StatusLine guifg=darkblue guibg=darkyellow gui=none ctermfg=blue ctermbg=yellow cterm=none'

if has('syntax')
  augroup InsertHook
    autocmd!
    autocmd InsertEnter * call s:StatusLine('Enter')
    autocmd InsertLeave * call s:StatusLine('Leave')
  augroup END
endif

let s:slhlcmd = ''
function! s:StatusLine(mode)
  if a:mode == 'Enter'
    silent! let s:slhlcmd = 'highlight ' . s:GetHighlight('StatusLine')
    silent exec g:hi_insert
  else
    highlight clear StatusLine
    silent exec s:slhlcmd
  endif
endfunction

function! s:GetHighlight(hi)
  redir => hl
  exec 'highlight '.a:hi
  redir END
  let hl = substitute(hl, '[\r\n]', '', 'g')
  let hl = substitute(hl, 'xxx', '', '')
  return hl
endfunction
""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""
" 最後のカーソル位置を復元する
""""""""""""""""""""""""""""""
if has("autocmd")
    autocmd BufReadPost *
    \ if line("'\"") > 0 && line ("'\"") <= line("$") |
    \   exe "normal! g'\"" |
    \ endif
endif

""""""""""""""""""""""""""""""
" コメントアウトの色を灰色に
hi Comment ctermfg=gray
