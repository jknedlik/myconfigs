execute pathogen#infect()

set autochdir
set nocompatible
syntax on
filetype plugin indent on
set rtp+=~/.vim/bundle/Vundle.vim
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
" Open NERDTree on opening
autocmd VimEnter * NERDTree 
" Jump to the main window.
autocmd VimEnter * wincmd p
let g:NERDTreeQuitOnOpen = 1
let g:onedark_terminal_italics = 1
colorscheme onedark
set number "line number
set statusline+=%#warningmsg#
    set statusline+=%{SyntasticStatuslineFlag()}
    set statusline+=%*

    let g:syntastic_always_populate_loc_list = 1
    let g:syntastic_auto_loc_list = 1
    let g:syntastic_check_on_open = 1
    let g:syntastic_check_on_wq = 0

call vundle#end()
