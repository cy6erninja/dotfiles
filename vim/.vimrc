" Exit insert mode using jk
inoremap jk <ESC>
let mapleader = "'"
let maplocalleader="\\"


syntax on
set number "Displays line numbers.
set ignorecase
set nobackup "Disables backup files. Because they stayed after I finished working with files.
set hlsearch 
set incsearch
set noswapfile

"==============NETRW CONFIG START=====================
"https://shapeshed.com/vim-netrw/#netrw---the-unloved-directory-browser

let g:netrw_liststyle=3 "Show directories as a tree.
let g:netrw_banner=0
let g:netrw_browse_split=0 "Open file in a new tab.
let g:netrw_winsize=15 "15% winsize

"==============NETRW CONFIG END=====================

"autocmd VimEnter * NERDTree
"autocmd VimEnter * wincmd p
"Close Nerdtree if it is the last window
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
"autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
"    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif

"nnoremap <leader>n :NERDTreeFocus<CR>


"=========================================
"JS/TS
"=========================================

"packloadall
"silent! helptags ALL

"ALE fixer/linter
"let b:ale_linters = ['eslint', 'prettier']
"let b:ale_linters = {'rust': ['analyzer']}
"let g:ale_fixers = {
"
"
"\   '*': ['remove_trailing_lines', 'trim_whitespace'],
"			\'javascript': ['standard','prettier','eslint'],
"
"			\'typescript': ['prettier'],
"			\}

"let g:prettier#exec_cmd_path = '~/.vim/pack/plugins/start/vim-prettier/node_modules/.bin/prettier'
"autocmd BufWritePre *.sol Prettier

"let g:ale_fix_on_save = 1
"let g:ale_linters_explicit = 1

"AUTOSAVER
let g:auto_save = 1

"TYPESCRIPT-VIM config
"setlocal indentkeys+=0.

"==========================================
"RUST
"==========================================
"syntax enable
"filetype plugin indent on
"set hidden
"let g:racer_cmd = "/home/user/.cargo/bin/racer"
"let g:rustfmt_autosave = 1
"let g:racer_experimental_completer = 1

" Commenting blocks of code.
"augroup commenting_blocks_of_code
"  autocmd!
"  autocmd FileType c,cpp,java,scala let b:comment_leader = '// '
"  autocmd FileType sh,ruby,python   let b:comment_leader = '# '
"  autocmd FileType conf,fstab       let b:comment_leader = '# '
"  autocmd FileType tex              let b:comment_leader = '% '
"  autocmd FileType mail             let b:comment_leader = '> '
"  autocmd FileType vim              let b:comment_leader = '" '
"augroup END
"noremap <silent> ,cc :<C-B>silent <C-E>s/^/<C-R>=escape(b:comment_leader,'\/')<CR>/<CR>:nohlsearch<CR>
"noremap <silent> ,cu :<C-B>silent <C-E>s/^\V<C-R>=escape(b:comment_leader,'\/')<CR>//e<CR>:nohlsearch<CR>

"packadd! fzf
"packadd! fzf.vim
"set rtp+=/usr/local/opt/fzf

"nnoremap <Leader>f :FZF<CR>

"===============RUSTY TAGS==========================
"https://github.com/dan-t/rusty-tags
"autocmd BufRead *.rs :setlocal tags=./rusty-tags.vi;/
"==============RUSTY_TAGS END=======================
"
"
"Ranger plugin configuration (https://github.com/francoiscabrol/ranger.vim)
let g:ranger_replace_netrw = 1
let g:ranger_map_keys = 0
"map <leader>f :RangerCurrentFileExistingOrNewTab<CR>




"FILE EXPLORER
"
inoremap <c-b> <Esc>:Lex<cr>:vertical resize 25<cr>
nnoremap <c-b> <Esc>:Lex<cr>:vertical resize 25<cr>
source /Users/sikachev/Developer/github/dotfiles/vim/dein.vim
