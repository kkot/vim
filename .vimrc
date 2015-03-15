scriptencoding utf-8

filetype off
filetype plugin indent on

syntax on

set ruler "wyswietla pozycje kursora w prawym dolnym rogu
set showmode "wyswietla tryb (wprowadzania, wizualny itd.)
set showcmd

"let mapleader = "," " change the mapleader from \ to ,
nnoremap ; :

set nocompatible
set hidden " don't need to save buffors before switching
set paste
set nobackup
set noswapfile
set nowrap        " don't wrap lines
set backspace=indent,eol,start " allow backspacing over everything in insert mode
set autoindent    " always set autoindenting on
set copyindent    " copy the previous indentation on autoindenting
set showmatch     " set show matching parenthesis
set ignorecase    " ignore case when searching
set smartcase     " ignore case if search pattern is all lowercase,
                  "    case-sensitive otherwise
set hlsearch      " highlight search terms
set incsearch     " show search matches as you type
set title         " change the terminal's title
set visualbell    " don't beep
set noerrorbells  " don't beep
set mouse=a

" tabs vs spaces
set tabstop=2     " a tab is four spaces
set shiftwidth=2  " number of spaces to use for autoindenting
set softtabstop=2
set shiftround    " use multiple of shiftwidth when indenting with '<' and '>'
set expandtab     " when expandtab is set, hitting Tab in insert mode will produce the appropriate number of spaces
set smarttab      " insert tabs on the start of a line according to shiftwidth, not tabstop

filetype plugin on 
filetype indent on

source $VIMRUNTIME/mswin.vim "ctrl-c,ctrl-v dziala

set lines=40 columns=100

set fileencodings=utf8,cp1250 "latin2
set encoding=utf8

"colorscheme delek
"set background=light
set guifont=Consolas:h10.5

set history=50 "rozmiar historii polecen
set clipboard=unnamed "yankuje do schowka systemowego

if has('gui_running')
    set guioptions-=T   " Get rid of toolbar"
    set guioptions+=b   " Horizontal scroll bar"
"   set guioptions-=m   " Get rid of menu    "
endif

nmap <silent> <leader>ev :e $HOME/vimfiles/_vimrc<CR>
map <Esc> :w <CR>
nnoremap <S-k> H
nnoremap <S-j> L

"map <F6> :!gdb ./a.out
map <F5> :syntax off<cr>

map <F2> :mksession! ~/vim_session <cr> " Quick write session with F2
map <F3> :source ~/vim_session <cr>     " And load session with F3
map <F8> :!start cmd /c "zcompile.bat"<CR>

nmap <silent> ,/ :nohlsearch<CR> " clear hightlight
nmap <C-f> /

"noremap  <buffer> <silent> k gk
"noremap  <buffer> <silent> j gj
"noremap  <buffer> <silent> 0 g0
"noremap  <buffer> <silent> $ g$

map zp :setlocal spell spelllang=pl<CR>
map zP :setlocal nospell<CR>
map ze :setlocal spell spelllang=en_us<CR>
map zE :setlocal nospell<CR>
set spellfile=~/vimfiles/spellfile.utf-8.add

map <Tab> <C-w><C-w><Cr>
noremap <C-kPlus> <C-A>
map <C-Tab> :bn<CR>
map <C-S-Tab> :bprev<CR>
map <C-o> <leader>be
map s <leader>be

"au BufNewFile,BufRead *.tex setlocal wrap linebreak nolist
au BufNewFile,BufRead *.tex :call ToggleWrap()
au BufNewFile,BufRead *.tex setlocal spell spelllang=pl
set shellslash " win32, latex can be called correctly

" Search for selected text, forwards or backwards.
vnoremap <silent> * :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy/<C-R><C-R>=substitute(
  \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>
vnoremap <silent> # :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy?<C-R><C-R>=substitute(
  \escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>


"set foldmethod=indent
"set foldignore=#/
"set foldlevelstart=20

"nmap zd :let @*=expand("%:p")<CR>
"nmap zwd :let @*=substitute(expand("%:p"),"\\","/","g")<CR>
"nmap zrd :let @*=expand("%:.")<CR>
"nmap zwrd :let @*=substitute(expand("%:."),"\\","/","g")<CR>

" ----------------------------------------------------------

noremap <silent> <Leader>w :call ToggleWrap()<CR>
function ToggleWrap()
  if &wrap
    echo "Wrap OFF"
    setlocal nowrap
    set virtualedit=all
    silent! iunmap <buffer> k
    silent! iunmap <buffer> j
  else
    echo "Wrap ON"
    setlocal wrap linebreak nolist
    set virtualedit=
    setlocal display+=lastline
    noremap  <buffer> <silent> k   gk
    noremap  <buffer> <silent> j   gj
  endif
endfunction
