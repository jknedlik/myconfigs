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
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
Plugin 'honza/vim-snippets'
Plugin 'jelera/vim-javascript-syntax' 
Plugin 'leafgarland/typescript-vim'
"Plugin 'coddingtonbear/neomake-platformio'

"python highlighting including fstrings
let g:python_highlight_all = 1
"vimtex auto format
let g:vimtex_format_enabled=0
let g:tex_flavor='latex'
let g:Tex_DefaultTargetFormat = 'pdf'
let g:vimtex_view_method='zathura'
let g:latex_viewer_general_viewer='zathura'
" Open NERDTree on opening
" map nerdtree to control n
nmap <C-c> :Lex<CR>
silent! map <C-n> :NERDTreeFind<CR>

let mapleader="-"
let maplocalleader="\\"
let g:NERDTreeMapActivateNode="<F3>"
let g:NERDTreeMapPreview="<F4>"
"let g:NERDTreeQuitOnOpen = 1
"nertree should cd when used
let g:NERDTreeChDirMode = 0
"clang format
source $HOME/.vim/config/.vimrc_clang-format
" map tagbar toggle to control b 
nmap <C-b> :TagbarToggle<CR>
"let tagbar change highlightedtag change faster
"silent! map <C-1> :NERDTreeFind<CR>
let g:onedark_terminal_italics = 1
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


"jannis fun way to move in vim/ end insert mode
let NERDTreeMapJumpLastChild='\J'
let NERDTreeMapJumpFirstChild='\K'

nnoremap J :tabp<CR>
nnoremap K :tabn<CR>

inoremap kj <esc>
inoremap jk <esc>


"let gitgutter stage hunkes/chunks and run between them
nmap ]h <Plug>(GitGutterNextHunk)
nmap [h <Plug>(GitGutterPrevHunk)
nmap <Leader>ha <Plug>(GitGutterStageHunk)
nmap <Leader>hr <Plug>(GitGutterUndoHunk)
"let g:gitgutter_highlight_lines = 1
let g:gitgutter_realtime = 1
let g:gitgutter_updatetime = 250
"hmmm
" easy movement in vim
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
" use onedark colorscheme

colorscheme onedark
"Set Terminal to allow for transparency
hi Normal guibg=NONE ctermbg=NONE
" glsl shader 
autocmd! BufNewFile,BufRead *.vs,*.fs,*.vert,*.frag set ft=glsl
let g:glsl_default_version = 'glsl450'
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
"highlight LineNr ctermfg=gray
"hi CursorLineNr term=bold ctermfg=11 gui=bold guifg=Yellow
"include coc config
source $HOME/.vim/config/.vimrc-coc
call vundle#end()
