"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
call dein#begin('~/.cache/dein')

" Let dein manage dein
" Required:
call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')
" Add or remove your plugins here like this:
"call dein#add('Shougo/neosnippet.vim')
"call dein#add('Shougo/neosnippet-snippets')
call dein#add('aserebryakov/vim-todo-lists')
call dein#add('907th/vim-auto-save')
call dein#add('sheerun/vim-polyglot')

" Colorschemes Start

call dein#add('kristijanhusak/vim-hybrid-material')
call dein#add('cocopon/iceberg.vim')
call dein#add('arcticicestudio/nord-vim')
call dein#add('sjl/badwolf')
call dein#add('lifepillar/vim-solarized8')
call dein#add('scheakur/vim-scheakur')
call dein#add('Badacadabra/vim-archery')

colorscheme scheakur
" Colorschemes End

" Required:
call dein#end()

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------
