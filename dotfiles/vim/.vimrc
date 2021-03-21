execute pathogen#infect()

set autochdir
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
Plugin 'ervandew/supertab' "completition with tab
"#Plugin 'vim-scripts/OmniCppComplete' "auto complete
Plugin 'octol/vim-cpp-enhanced-highlight' "syntax highlighting
Plugin 'vim-scripts/Cpp11-Syntax-Support'
Plugin 'majutsushi/tagbar' "tagbar not working
Plugin 'universal-ctags/ctags'
"Plugin 'justmao945/vim-clang' "c++ autocompletion
Plugin 'kana/vim-operator-user'
Plugin 'rhysd/vim-clang-format' "c++ clang format 
Plugin 'vim-syntastic/syntastic' "formatting rules for different language
Plugin 'joshdick/onedark.vim' 
Plugin 'scrooloose/nerdtree' 
" Git Trio plugins to do anything you like
Plugin 'tpope/vim-fugitive' 
Plugin 'itchyny/vim-gitbranch' 
Plugin 'airblade/vim-gitgutter' 
Plugin 'ycm-core/YouCompleteMe' 
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
Plugin 'coddingtonbear/neomake-platformio'
Plugin 'aars/syntastic-platformio'

"python highlighting including fstrings
let g:python_highlight_all = 1
"vimtex auto format
let g:vimtex_format_enabled=0
let g:tex_flavor='latex'
let g:Tex_DefaultTargetFormat = 'pdf'
let g:vimtex_view_method='zathura'
let g:vimtex_view_method='zathura'
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
let g:NERDTreeChDirMode = 2
"clang format
autocmd FileType c ClangFormatAutoEnable
autocmd FileType cpp ClangFormatAutoEnable
autocmd FileType c,cpp,objc nnoremap <buffer><Leader>cf :<C-u>ClangFormat<CR>
autocmd FileType c,cpp,objc vnoremap <buffer><Leader>cf :ClangFormat<CR>
" if you install vim-operator-user
autocmd FileType c,cpp,objc map <buffer><Leader>x <Plug>(operator-clang-format)
let g:ClangFormatAutoEnable = 1
let g:clang_format#style_options = {
            \ "AccessModifierOffset" : -4,
            \ "AllowShortIfStatementsOnASingleLine" : "true",
            \ "AllowShortFunctionsOnASingleLine" : "true",
            \ "AllowShortLoopsOnASingleLine" : "true",
            \ "AlwaysBreakTemplateDeclarations" : "true",
            \ "Standard" : "C++11",
            \ "BreakBeforeBraces" : "Stroustrup",
            \ "IndentWidth" : "2"}
" Toggle auto formatting:
nmap <Leader>C :ClangFormatAutoToggle<CR>

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
"Set vim-clang to use
let g:clang_cpp_options = '-std=c++17 -I.. -I.' 
let g:clang_compilation_database = './build'
let g:clang_verbose_pmenu = 0
" enable debug with let g:clang_debug = 3
" ycm settings
  let g:ycm_confirm_extra_conf = 0
  let g:ycm_log_level='debug' 

" glsl shader 
autocmd! BufNewFile,BufRead *.vs,*.fs,*.vert,*.frag set ft=glsl
set number "line number
set statusline+=%#warningmsg#
    set statusline+=%{SyntasticStatuslineFlag()}
    set statusline+=%*

    let g:syntastic_always_populate_loc_list = 1
    let g:syntastic_auto_loc_list = 1
    let g:syntastic_enable_signs=1
    let g:syntastic_error_symbol = '✗'
    let g:syntastic_warning_symbol = '⚠'
    let g:syntastic_check_on_open = 1
    let g:syntastic_check_on_wq = 0
    let g:syntastic_quiet_messages = {
			    \ "regex": [
			    \ '\mpossible unwanted space at "{"',
			    \ 'backward_warning.h'
			    \ ] } 
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
"
inoremap <c-v>  <Plug>(fakeclip-p)
"highlight LineNr ctermfg=gray
"hi CursorLineNr term=bold ctermfg=11 gui=bold guifg=Yellow
"include coc config
source $HOME/.vim/config/.vimrc-coc
call vundle#end()
