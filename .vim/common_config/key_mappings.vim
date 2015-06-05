let mapleader=","

" easy wrap toggling
nmap <Leader>w :set wrap!<cr>
nmap <Leader>W :set nowrap<cr>

" close all other windows (in the current tab)
nmap gW :only<cr>

" go to the alternate file (previous buffer) with g-enter
nmap g 

" shortcuts for frequenly used files
nmap gs :e db/schema.rb<cr>
nmap gr :e config/routes.rb<cr>
nmap gm :e Gemfile<cr>

" insert blank lines without going into insert mode
nmap go o<esc>
nmap gO O<esc>

" mapping the jumping between splits. Hold control while using vim nav.
nmap <C-J> <C-W>j
nmap <C-K> <C-W>k
nmap <C-H> <C-W>h
nmap <C-L> <C-W>l

" Yank from the cursor to the end of the line, to be consistent with C and D.
nnoremap Y y$

" select the lines which were just pasted
nnoremap vv `[V`]

" clean up trailing whitespace
map <Leader>c :StripTrailingWhitespaces<cr>

" compress excess whitespace on current line
map <Leader>e :s/\v(\S+)\s+/\1 /<cr>:nohl<cr>

" delete all buffers
map <Leader>d :bufdo bd<cr>

" map spacebar to clear search highlight
nnoremap <Leader><space> :noh<cr>

" buffer resizing mappings (shift + arrow key)
nnoremap <S-Up> <c-w>+
nnoremap <S-Down> <c-w>-
nnoremap <S-Left> <c-w><
nnoremap <S-Right> <c-w>>

" reindent the entire file
map <Leader>I gg=G``<cr>

" insert the path of currently edited file into a command
" Command mode: Ctrl-P
cmap <C-S-P> <C-R>=expand("%:p:h") . "/" <cr>

" copy current filename into system clipboard - mnemonic: (c)urrent(f)ilename
nnoremap <silent> <leader>cf :let @* = expand("%:~")<CR>

"handy mapping for vertical split windows
map <leader>v :vsplit <cr>

"re-select after indenting -- would like to remove
vnoremap < <gv
vnoremap > >gv

" Map the escape key to
inoremap jj <Esc>
inoremap jk <Esc>

" remap F1 to ESC to stop getting that stupid help text
noremap <F1> <Esc>

"Handy mapping to cd to current files directory
noremap <leader>cd :cd %:p:h <Enter>

" Find the related spec for any file you open. Requires
"  * Your specs live in spec/ or fast_spec/
"  * Your pwd (current dir) is the project root
"  * You use the same dir structure in your code and specs so that
"    code living at lib/foo/bar.rb has a spec at spec/lib/foo/bar.rb
"
" This method handles files in fast_spec unlike the :A and :AV functions
" that ship with rails.vim
function! FindSpec()
  let s:fullpath = expand("%:p")
  let s:filepath = expand("%:h")
  let s:fname = expand("%:t")

  " Possible names for the spec/test for the file we're looking at
  let s:test_names = [substitute(s:fname, ".rb$", "_spec.rb", ""), substitute(s:fname, ".rb$", "_test.rb", "")]

  " Possible paths
  let s:test_paths = ["spec", "fast_spec", "test"]
  for test_name in s:test_names
    for path in s:test_paths
      let s:filepath_without_app = substitute(s:filepath, "app/", "", "")
      let s:spec_path = path . "/" . s:filepath_without_app . "/" . test_name
      let s:full_spec_path = substitute(s:fullpath, s:filepath . "/" . s:fname, s:spec_path, "")
      if filereadable(s:full_spec_path)
        execute ":botright vsp " . s:full_spec_path
        return
      endif
    endfor
  endfor
endfunction

nnoremap <C-s> :call FindSpec()<CR>

" Command-/ to toggle comments
map <D-/> <plug>NERDCommenterToggle<CR>

" Command-T for ControlP -- just fyi I don't like this :)
macmenu &File.New\ Tab key=<D-T>
map <D-t> :CtrlP<CR>
imap <D-t> <Esc>:CtrlP<CR>
