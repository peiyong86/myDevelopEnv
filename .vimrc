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

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" My other setting
 " For molokai
let g:molokai_original = 1
 " For UltiSnips
let g:UltiSnipsExpandTrigger="ii"
let g:UltiSnipsJumpForwardTrigger="II"
let g:UltiSnipsJumpBackwardTrigger="OO"
let g:UltiSnipsListSnippets="iI"

set nu
set tabstop=4
set shitfwidth=4
