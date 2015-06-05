" use gui tabs
set guioptions+=e

" kill the menubar
set guioptions-=T

" kill the scrollbars
set guioptions-=r
set guioptions-=L

" go full screen like you mean it
if has('win32')
  au GUIEnter * simalt ~x
elseif has('mac')
  set fuoptions=maxvert,maxhorz
endif

" set a valid swap file location
if has('win32')
  set directory=%TEMP%
endif

" turn off beeping and prevent screen lighting flash
if has('win32')
  set noerrorbells visualbell t_vb=
  autocmd GUIEnter * set visualbell t_vb=
endif

" Command-T for ControlP -- just fyi I don't like this :)
if has('gui_macvim')
  macmenu &File.New\ Tab key=<D-T>
  map <D-t> :CtrlP<CR>
  imap <D-t> <Esc>:CtrlP<CR>
end

" set default font
" https://github.com/Lokaltog/powerline-fonts
set guifont=Meslo\ LG\ S\ DZ\ Regular\ for\ Powerline:h15

" initial window size
set lines=45 columns=120

" pretty but not terminal-compatible color scheme
colorscheme gruvbox
set background=dark

runtime! custom_config/*.gvim

