set number
if &compatible
  set nocompatible
endif
set runtimepath+=$HOME/.vim/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('$HOME/.vim/dein')
  call dein#begin('$HOME/.vim/dein')

  call dein#add('$HOME/.vim/dein')
  call dein#add('Shougo/neocomplete.vim')
  call dein#add('Shougo/vimfiler')
  call dein#add('Shougo/unite.vim')

  call dein#end()
  call dein#save_state()
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


filetype plugin indent on
syntax enable

" auto reload .vimrc
augroup source-vimrc
  autocmd!
  autocmd BufWritePost *vimrc source $MYVIMRC | set foldmethod=marker
  autocmd BufWritePost *gvimrc if has('gui_running') source $MYGVIMRC
augroup END
