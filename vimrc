execute pathogen#infect()

set autochdir
set nocompatible
syntax on
filetype plugin indent on
set rtp+=~/.vim/bundle/Vundle.vim
set laststatus=2
call vundle#begin()

Plugin 'VundleVim/Vundle.vim' "vundle manager
Plugin 'itchyny/lightline.vim'  "bottom line with information
Plugin 'ervandew/supertab' "completition with tab
Plugin 'vim-scripts/OmniCppComplete' "auto complete
Plugin 'octol/vim-cpp-enhanced-highlight' "syntax highlighting
Plugin 'vim-scripts/Cpp11-Syntax-Support'
Plugin 'majutsushi/tagbar' "tagbar not working
Plugin 'universal-ctags/ctags'
Plugin 'justmao945/vim-clang' "c++ autocompletion
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
" Open NERDTree on opening
" map nerdtree to control n
nmap <C-v> :NERDTreeToggle<CR>
silent! map <C-n> :NERDTreeFind<CR>

let g:NERDTreeMapActivateNode="<F3>"
let g:NERDTreeMapPreview="<F4>"
"let g:NERDTreeQuitOnOpen = 1
"nertree should cd when used
let g:NERDTreeChDirMode = 2

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
"let gitgutter stage hunkes/chunks and run between them
nmap ]h <Plug>GitGutterNextHunk
nmap [h <Plug>GitGutterPrevHunk
nmap <Leader>ha <Plug>GitGutterStageHunk
nmap <Leader>hr <Plug>GitGutterUndoHunk
"let g:gitgutter_highlight_lines = 1
let g:gitgutter_realtime = 1
let g:gitgutter_updatetime = 250
"hmmm
" use onedark colorscheme
colorscheme onedark
set number "line number
set statusline+=%#warningmsg#
    set statusline+=%{SyntasticStatuslineFlag()}
    set statusline+=%*

    let g:syntastic_always_populate_loc_list = 1
    let g:syntastic_auto_loc_list = 1
    let g:syntastic_check_on_open = 1
    let g:syntastic_check_on_wq = 0
    let g:syntastic_quiet_messages = {
			    \ "regex": [
			    \ '\mpossible unwanted space at "{"'
			    \ ] } 
call vundle#end()

