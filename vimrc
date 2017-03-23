exec pathogen#infect()
syntax on

" --- Lets and sets --- "

set laststatus=2
set nocompatible

set fileencoding=UTF-8
set encoding=UTF-8

let mapleader=","
let maplocalleader="\\"
let g:session_autosave = 'no'
let g:arpeggio_timeoutlen = 5

set splitbelow
set splitright

set backspace=2
set noet
set ts=4
set shiftwidth=4
set softtabstop=4

set number
set relativenumber
set list
set listchars=tab:>\ ,eol:`
set nowrap

set smartindent
set foldmethod=syntax
set foldlevelstart=20

let g:NERDTreeDirArrows=0
let NERDTreeDirArrows=0
set noeb vb t_vb=

set scrolloff=10

" --- Mappings --- "

nnoremap j gj
vnoremap j gj
vnoremap k gk
nnoremap k gk
nnoremap <F12> :e ++enc=utf-8<CR>
nnoremap vv <C-V>

" go hard or go home
map h b
map H B
map l w
map L W

" split movement
nnoremap <C-H> <C-W><C-H>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>

nnoremap ! :! 

" I really want to use arpeggio for this
" but I haven't quite gotten it to work yet
inoremap kj <Esc>
inoremap jk <Esc>
cnoremap kj <Esc>
cnoremap jk <Esc>
vnoremap iu <Esc>
vnoremap ui <Esc>
cnoremap iu <cr>

nnoremap <F4> :!wc -m %<CR>

nnoremap <M-i> I//<Esc>

" Navigate to prev/next line with same level of indentation
nnoremap <M-,> :call search('^'. matchstr(getline('.'), '\(^\s*\)') .'\%<' . line('.') . 'l\S', 'be')<CR>
nnoremap <M-.> :call search('^'. matchstr(getline('.'), '\(^\s*\)') .'\%>' . line('.') . 'l\S', 'e')<CR>

" Close opened buffer (including window if doing splits)
nnoremap <Leader>bc :bdelete<cr>
nnoremap <Leader>cs I/*<Esc>
nnoremap <Leader>ce A*/<Esc>
nnoremap <Leader>ca A // 
nnoremap <Leader>cc I// <Esc>
nnoremap <Leader>cn :NERDTreeTabsClose<cr>
nnoremap <Leader>cr V:s`\v// ?(.*)`\1`<cr>
nnoremap <Leader>ct V:s`\v\/\* *(.*) *\*\/`// \1`<cr>
nnoremap <Leader>cT V:s/\v(\t*[^\t]+)(\t+)/\1 /<cr>
nnoremap <Leader>d :tabe %
nnoremap <Leader>ds :! rm ~/.vim/sessions/
nnoremap <Leader>e :e 
nnoremap <Leader>fb f}
nnoremap <Leader>fx :NERDTreeFocus<cr>
nnoremap <Leader>gh gT
nnoremap <Leader>gj gt
nnoremap <Leader>hs :split<cr>
nnoremap <Leader>jb be<space>x
nnoremap <Leader>jf wbe<space>x
nnoremap <Leader>lb F{
nnoremap <Leader>M :! make<cr>
nnoremap <Leader>mv :NERDTreeClose<cr><C-W>t<C-W>H
nnoremap <Leader>mh :NERDTreeClose<cr><C-W>t<C-W>K
" map <Leader>ms :mks ~/.vim/sessions/ " VIM-SESSIONS
nnoremap <Leader>R :so $MYVIMRC<cr>
nnoremap <Leader>n :new<CR>
nnoremap <Leader>ow :w<cr>
nnoremap <Leader>ot :! explorer %<cr>
" map <Leader>os :so ~/.vim/sessions/ " VIM-SESSIONS
nnoremap <Leader>p y V:s/<C-R>*/<C-R>*\r/g<CR>
vnoremap <Leader>p yV:s/<C-R>*/<C-R>*\r/g<CR>
nnoremap <Leader>q :q<cr>
nnoremap <Leader>rt "pyiw:s/<C-r>p/
" REALLY quit
nnoremap <Leader>rq :q!<CR>
" map <Leader>ss :mks!<CR> " VIM-SESSIONS
" Move word down to the line beneath it (removing space as we do so)
nnoremap <Leader>s ebhr<cr>w
nnoremap <Leader>te :tabe 
nnoremap <Leader>tt :! tasks<cr>
nnoremap <Leader>ta ^yg_:! taskadd <C-R>0
vnoremap <Leader>ta y:! taskadd <C-R>0
" nnoremap <Leader>tt :TlistToggle<CR>
" nnoremap <Leader>tu :TlistUpdate<CR>
nnoremap <Leader>vn :vnew<cr>
nnoremap <Leader>vs :vsplit<cr>
nnoremap <Leader>w :wa<cr>
nnoremap <Leader>wq :wq<cr>
nnoremap <Leader>wt :w<cr>
nnoremap <Leader>x :NERDTreeTabsToggle<cr>
vnoremap <Leader>z ::w !sql<CR>
nnoremap <Leader>z :%w !sql<CR>
nnoremap <Leader>fz VG::w !sql<CR>

" Open matching .c/.h files for C stuff
" (given a matching source/ include/ folder structure)
" (eg source/foo.c has a matching include/foo.h)
nnoremap <Leader>oc :e <C-R>=OpenIn(@%, "include", "source", "h", "c")<CR><CR>
nnoremap <Leader>oh :e <C-R>=OpenIn(@%, "source", "include", "c", "h")<CR><CR>
nnoremap <Leader>toc :tabe <C-R>=OpenIn(@%, "include", "source", "h", "c")<CR><CR>
nnoremap <Leader>toh :tabe <C-R>=OpenIn(@%, "source", "include", "c", "h")<CR><CR>
function! OpenIn(path, from, to, extfrom, extto)
	let l:p = substitute(a:path, a:from, a:to, '')
	let l:p = substitute(l:p, "\\." . a:extfrom, "." . a:extto, '')
	return l:p
endfunction

" Open "hovered" source file/include file
" (again, based on folder structure)
nnoremap <Leader>of yi":tabe <C-R>"
nnoremap <Leader>oi yi":tabe include/<C-R>"<cr>

" ? What am I using these for?
hi Visual ctermbg=Blue
hi Visual ctermfg=White

" green statusline in insert mode
if version >= 700
	au InsertEnter * hi StatusLine term=reverse ctermfg=2 ctermbg=white
	au InsertLeave * hi StatusLine term=reverse ctermfg=white ctermbg=9
endif
