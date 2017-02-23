" My .vimrc file
" Author: peiyong
" Email: peiyong86@gmail.com
" -----------------------------------------------
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" My Plugins
Plugin 'tomasr/molokai'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'easymotion/vim-easymotion'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" My other setting
 " For molokai
colorscheme molokai

 " For UltiSnips
let g:UltiSnipsExpandTrigger="ii"
let g:UltiSnipsJumpForwardTrigger="II"
let g:UltiSnipsJumpBackwardTrigger="OO"
let g:UltiSnipsListSnippets="iI"

 " For Nerd tree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
map <C-n> :NERDTreeToggle<CR>

 " For Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

 " For Easymotion
nmap s <Plug>(easymotion-overwin-f)
nmap L <Plug>(easymotion-overwin-line)
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
map F <Plug>(easymotion-bd-wl)

 " Others
set nu
set tabstop=4
set shiftwidth=4
