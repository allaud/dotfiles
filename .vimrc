set nocompatible
filetype off                  " required
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'kristijanhusak/vim-hybrid-material'
Plugin 'pangloss/vim-javascript'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-sensible'
Plugin 'mxw/vim-jsx'
Plugin 'tpope/vim-commentary'
Plugin 'jeetsukumaran/vim-buffergator'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'rking/ag.vim'
Plugin 'jiangmiao/auto-pairs'
Plugin 'Valloric/MatchTagAlways'
Plugin 'Valloric/YouCompleteMe'
Plugin 'mattn/emmet-vim'
Plugin 'cakebaker/scss-syntax.vim'
call vundle#end()            " required
filetype plugin indent on    " required

set noswapfile
set number
set backspace=indent,eol,start
set guifont=Source\ Code\ Pro\ Medium\:h15
set equalalways

set smarttab
set nolist
set tabstop=2
set expandtab
set shiftwidth=2
set softtabstop=2
set hidden

let mapleader=" "
syntax on
set background=dark
colorscheme hybrid_material
let g:enable_bold_font = 1
let g:enable_italic_font = 1

" remove trailing whitespaces
autocmd BufWritePre * %s/\s\+$//e

let g:buffergator_viewport_split_policy = "b"
let g:buffergator_sort_regime = "mru"
let g:buffergator_show_full_directory_path = 0

map <Leader>n :NERDTreeToggle<CR>
map <Leader>m :NERDTreeFind<CR>

let g:jsx_ext_required = 0

let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_semantic_triggers =  {
    \   'css': ['    ', ': '],
    \   'scss': ['    ', '  ', ': '],
    \ }


" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" ignore some folders
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'

" highlight Ag search
let g:ag_highlight=1

" grep current motion
nnoremap <silent> gr :set opfunc=<SID>GrepMotion<CR>g@
xnoremap <silent> gr :<C-U>call <SID>GrepMotion(visualmode())<CR>
function! s:CopyMotionForType(type)
  if a:type ==# 'v'
    silent execute "normal! `<" . a:type . "`>y"
  elseif a:type ==# 'char'
    silent execute "normal! `[v`]y"
  endif
endfunction
function! s:GrepMotion(type) abort
  let reg_save = @@
  call s:CopyMotionForType(a:type)
  execute ":Ag! " . shellescape(@@)
  let @@ = reg_save
endfunction
