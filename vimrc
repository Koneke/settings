exec pathogen#infect()
syntax on

colorscheme pablo
colors pablo
set nocompatible

let mapleader=","

call camelcasemotion#CreateMotionMappings('<leader>')

omap <silent> iw <Plug>CamelCaseMotion_ib
xmap <silent> iw <Plug>CamelCaseMotion_ib

map <silent> w <Plug>CamelCaseMotion_w
map <silent> b <Plug>CamelCaseMotion_b
map <silent> e <Plug>CamelCaseMotion_e
map <silent> ge <Plug>CamelCaseMotion_ge
sunmap w
sunmap b
sunmap e
sunmap ge

nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

map <Leader>te :tabe 
map <Leader>w :w<cr>
map <Leader>q :q<cr>
map <Leader>wq :wq<cr>
map <Leader>a gT
map <Leader>f gt
map <Leader>cs I/*<Esc>
map <Leader>ce A*/<Esc>
map <Leader>cc I//<Esc>

set backspace=2
set noet
set ts=4
set shiftwidth=4
set softtabstop=4
set number
set list
set listchars=tab:>·
