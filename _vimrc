colorscheme pablo
colors pablo
set nocompatible
syntax on

let mapleader=","

exec pathogen#infect()

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

map j gj
map k gk

map <Leader>te :tabe 
map <Leader>w :w<cr>
map <Leader>q :q<cr>
map <Leader>wq :wq<cr>
map <Leader>a gT
map <Leader>f gt
map <Leader>e :!e @%
