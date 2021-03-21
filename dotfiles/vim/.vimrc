execute pathogen#infect()

"set autochdir
set nocompatible
syntax on
filetype plugin indent on
set rtp+=~/.vim/bundle/Vundle.vim
set laststatus=2
call vundle#begin()
set encoding=utf-8

"using the fake clipboard in wayland
let g:fakeclip_provide_clipboard_key_mappings = !empty($WAYLAND_DISPLAY)
Plugin 'kana/vim-fakeclip'
Plugin 'tikhomirov/vim-glsl'
Plugin 'neomake/neomake'
Plugin 'jackguo380/vim-lsp-cxx-highlight'
Plugin 'vim-python/python-syntax'
Plugin 'plasticboy/vim-markdown'
Plugin 'vim-scripts/slimv.vim'
Plugin 'neomutt/neomutt.vim'
Plugin 'VundleVim/Vundle.vim' "vundle manager
Plugin 'itchyny/lightline.vim'  "bottom line with information
Plugin 'myint/syntastic-extras'
Plugin 'octol/vim-cpp-enhanced-highlight' "syntax highlighting
Plugin 'vim-scripts/Cpp11-Syntax-Support'
Plugin 'majutsushi/tagbar' "tagbar not working
Plugin 'universal-ctags/ctags'
Plugin 'kana/vim-operator-user'
Plugin 'rhysd/vim-clang-format' "c++ clang format 
Plugin 'vim-syntastic/syntastic' "formatting rules for different language
Plugin 'joshdick/onedark.vim' 
Plugin 'scrooloose/nerdtree' 
" Git Trio plugins to do anything you like
Plugin 'tpope/vim-fugitive' 
Plugin 'itchyny/vim-gitbranch' 
Plugin 'airblade/vim-gitgutter' 
Plugin 'lervag/vimtex' 
Plugin 'Shougo/neosnippet.vim' 
Plugin 'Shougo/neosnippet-snippets'
"snipmate
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'mileszs/ack.vim' " ackvim and ag as search engine install the_silver_searcher
nnoremap - <nop>
let mapleader="-"
let maplocalleader="\\"
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
Plugin 'honza/vim-snippets'
Plugin 'jelera/vim-javascript-syntax' 
Plugin 'leafgarland/typescript-vim'

"vimtex auto format
let g:vimtex_format_enabled=0
let g:tex_flavor='latex'
let g:Tex_DefaultTargetFormat = 'pdf'
let g:vimtex_view_method='zathura'
let g:latex_viewer_general_viewer='zathura'

"nerdtree config
source $HOME/.vim/config/.vimrc-nerdtree
"clang format config
source $HOME/.vim/config/.vimrc_clang-format
let g:lightline = {
      \ 'colorscheme': 'one',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'git:','gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ },
      \ }


" gitgutter 
source $HOME/.vim/config/.vimrc-git

" use onedark colorscheme
colorscheme onedark
"Set Terminal to allow for transparency
hi Normal guibg=NONE ctermbg=NONE
set number "line number
"syntastic cpp 
source $HOME/.vim/config/.vimrc-c++

:set number relativenumber

augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END
hi CursorLineNR cterm=bold
augroup CLNRSet
    autocmd! ColorScheme * hi CursorLineNR cterm=bold
augroup END
set cursorline

inoremap <c-v>  <Plug>(fakeclip-p)
"include coc config
source $HOME/.vim/config/.vimrc-coc
" jump between tabs
nnoremap J :tabp<CR>
nnoremap K :tabn<CR>

" easy movement in vim
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
"SECTION <SMALL configs>
"python highlighting including fstrings
let g:python_highlight_all = 1
"set filenames for glsl highlight
autocmd! BufNewFile,BufRead *.vs,*.fs,*.vert,*.frag set ft=glsl
let g:glsl_default_version = 'glsl450'
" map tagbar toggle to control b 
nmap <C-b> :TagbarToggle<CR>

call vundle#end()
