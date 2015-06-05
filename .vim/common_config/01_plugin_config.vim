" Plugins are managed by NeoBundle. Once VIM is open run :NeoBundleInstall to
" install plugins.
 call neobundle#begin(expand('~/.vim/bundle/'))

 " Let NeoBundle manage NeoBundle
 NeoBundleFetch 'Shougo/neobundle.vim'

" Plugins requiring no additional configuration or keymaps
  NeoBundle "michaeljsmith/vim-indent-object.git"
  NeoBundle "oscarh/vimerl.git"
  NeoBundle "pangloss/vim-javascript.git"
  NeoBundle "tomtom/tcomment_vim.git"
  NeoBundle "tpope/vim-endwise.git"
  NeoBundle "tpope/vim-fugitive.git"
  NeoBundle "tpope/vim-haml.git"
  NeoBundle "tpope/vim-rake.git"
  NeoBundle "tpope/vim-repeat.git"
  NeoBundle "vim-ruby/vim-ruby.git"
  NeoBundle "vim-scripts/L9.git"
  NeoBundle "vim-scripts/matchit.zip"
  NeoBundle "vim-scripts/ruby-matchit.git"
  NeoBundle "tpope/vim-abolish.git"
  NeoBundle "robgleeson/vim-markdown-preview.git"
  NeoBundle "ecomba/vim-ruby-refactoring.git"
  NeoBundle "ecomba/rweald/slurper.vim.git"
  NeoBundle "joestelmach/javaScriptLint.vim.git"
  NeoBundle "tpope/vim-bundler.git"
  NeoBundle "marcus/autotag.vim.git"
  NeoBundle "derekwyatt/vim-scala.git"
  NeoBundle "rweald/pig.vim.git"
  NeoBundle "sickill/vim-pasta.git"
  NeoBundle "vim-scripts/mru.vim.git"
  NeoBundle "xolox/vim-session.git"
  NeoBundle "duff/vim-bufonly.git"
  NeoBundle "garbas/vim-snipmate.git"
  NeoBundle "tomtom/tlib_vim.git"
  NeoBundle "MarcWeber/vim-addon-mw-utils.git"
  NeoBundle "scrooloose/nerdcommenter.git"
  NeoBundle "aghareza/vim-gitgrep.git"
  NeoBundle "wookiehangover/jshint.vim.git"
  NeoBundle "airblade/vim-gitgutter.git"
  NeoBundle "klen/python-mode.git"

 " Vim airline configs
  NeoBundle 'bling/vim-airline.git'
  let g:airline_powerline_fonts = 1
  let g:airline_mode_map = {
      \ '__' : '-',
      \ 'n'  : 'N',
      \ 'i'  : 'I',
      \ 'R'  : 'R',
      \ 'c'  : 'C',
      \ 'v'  : 'V',
      \ 'V'  : 'V',
      \ '' : 'V',
      \ 's'  : 'S',
      \ 'S'  : 'S',
      \ '' : 'S',
      \ }

" Easy motion config
  NeoBundle "Lokaltog/vim-easymotion.git"

"Supertab code completion"
  NeoBundle "ervandew/supertab.git"
  let g:SuperTabContextDefaultCompletionType = "<c-n>"


" Dash Searching"
  NeoBundle "rizzatti/funcoo.vim.git"
  NeoBundle "rizzatti/dash.vim.git"
    nmap <Leader>qs <Plug>DashSearch
    nmap <Leader>qa <Plug>DashGlobalSearch


" CtrlP
  NeoBundle "kien/ctrlp.vim.git"
    nnoremap <Leader>b :<C-U>CtrlPBuffer<CR>
    nnoremap <Leader>t :<C-U>CtrlP<CR>
    nnoremap <Leader>T :<C-U>CtrlPTag<CR>
    map <Leader>cpc :CtrlPClearCache<CR>

    " respect the .gitignore
    let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . --cached --exclude-standard --others']

" Go
  NeoBundle "jnwhiteh/vim-golang.git"
    au BufNewFile,BufRead *.go set filetype=go

" Slim
  NeoBundle "slim-template/vim-slim.git"
    au BufNewFile,BufRead *.slim set filetype=slim

" Less
  NeoBundle "groenewege/vim-less.git"
    au BufNewFile,BufRead *.less set filetype=less

" Handlebars, Mustache, and Friends
  NeoBundle "mustache/vim-mustache-handlebars.git"
  au  BufNewFile,BufRead *.mustache,*.handlebars,*.hbs,*.hogan,*.hulk,*.hjs set filetype=html syntax=mustache | runtime! ftplugin/mustache.vim ftplugin/mustache*.vim ftplugin/mustache/*.vim

" Stylus
  NeoBundle "wavded/vim-stylus.git"
    au BufNewFile,BufRead *.styl set filetype=stylus

" Coffee script
  NeoBundle "kchmck/vim-coffee-script.git"
    au BufNewFile,BufRead *.coffee set filetype=coffee

" Erlang
  NeoBundle "oscarh/vimerl.git"

" LaTeX
  NeoBundle "kevinstreit/VIM-Latex.git"

" AG aka The Silver Searcher
  NeoBundle 'rking/ag.vim.git'
    nmap g/ :Ag!<space>
    nmap g* :Ag! -w <C-R><C-W><space>
    nmap ga :AgAdd!<space>
    nmap gn :cnext<CR>
    nmap gp :cprev<CR>
    nmap gq :ccl<CR>
    nmap gl :cwindow<CR>

" STR ag commands
    nnoremap <leader>ag :Ag
    nnoremap <leader>gg :GitGrep


" Tagbar for navigation by tags using CTags
  NeoBundle "majutsushi/tagbar.git"
    let g:tagbar_autofocus = 1
    map <Leader>rt :!ctags --extra=+f -R *<CR><CR>
    map <Leader>. :TagbarToggle<CR>
    map <C-\> :tnext<CR>

" Markdown syntax highlighting
  NeoBundle "tpope/vim-markdown.git"
    augroup mkd
      autocmd BufNewFile,BufRead *.mkd      set ai formatoptions=tcroqn2 comments=n:> filetype=markdown
      autocmd BufNewFile,BufRead *.md       set ai formatoptions=tcroqn2 comments=n:> filetype=markdown
      autocmd BufNewFile,BufRead *.markdown set ai formatoptions=tcroqn2 comments=n:> filetype=markdown
    augroup END

" NERDTree for project drawer
  NeoBundle "scrooloose/nerdtree.git"
    let NERDTreeHijackNetrw = 0
    let NERDTreeIgnore=['\.rbc$', '\~$']
    nmap <leader>g :NERDTreeToggle<CR>
    nmap <leader>G :NERDTreeFind<CR>
    map <Leader>nt :NERDTreeToggle<CR>


" Tabular for aligning text
  NeoBundle "godlygeek/tabular.git"
    function! CustomTabularPatterns()
      if exists('g:tabular_loaded')
        AddTabularPattern! symbols         / :/l0
        AddTabularPattern! hash            /^[^>]*\zs=>/
        AddTabularPattern! chunks          / \S\+/l0
        AddTabularPattern! assignment      / = /l0
        AddTabularPattern! comma           /^[^,]*,/l1
        AddTabularPattern! colon           /:\zs /l0
        AddTabularPattern! options_hashes  /:\w\+ =>/
      endif
    endfunction

    autocmd VimEnter * call CustomTabularPatterns()

    " shortcut to align text with Tabular
    map <Leader>a :Tabularize<space>

" ZoomWin to fullscreen a particular buffer without losing others
  NeoBundle "vim-scripts/ZoomWin.git"
    map <Leader>z :ZoomWin<CR>
    map <Leader><Leader> :ZoomWin<CR>


" Unimpaired for keymaps for quicky manipulating lines and files
  NeoBundle "tpope/vim-unimpaired.git"


" Syntastic for catching syntax errors on save
  NeoBundle "scrooloose/syntastic.git"
    let g:syntastic_enable_signs=1
    let g:syntastic_quiet_messages = {'level': 'warning'}
    " syntastic is too slow for haml and sass
    let g:syntastic_mode_map = { 'mode': 'active',
                               \ 'active_filetypes': [],
                               \ 'passive_filetypes': ['haml','scss','sass'] }


" gundo for awesome undo tree visualization
  NeoBundle "sjl/gundo.vim.git"
    map <Leader>h :GundoToggle<CR>


" rails.vim, nuff' said
  NeoBundle "tpope/vim-rails.git"
    map <Leader>oc :Rcontroller<Space>
    map <Leader>ov :Rview<Space>
    map <Leader>om :Rmodel<Space>
    map <Leader>oh :Rhelper<Space>
    map <Leader>oj :Rjavascript<Space>
    map <Leader>os :Rstylesheet<Space>
    map <Leader>oi :Rintegration<Space>


" surround for adding surround 'physics'
  NeoBundle "tpope/vim-surround.git"
    " # to surround with ruby string interpolation
    let g:surround_35 = "#{\r}"
    " - to surround with no-output erb tag
    let g:surround_45 = "<% \r %>"
    " = to surround with output erb tag
    let g:surround_61 = "<%= \r %>"


" Clojure Highlighting"
  NeoBundle "tpope/vim-fireplace.git"
  NeoBundle "tpope/vim-classpath.git"
  NeoBundle "guns/vim-clojure-static.git"
  NeoBundle "vim-scripts/paredit.vim"
  NeoBundle "amdt/vim-niji.git"
  autocmd BufNewFile,BufRead *.clj set filetype=clojure
  autocmd BufNewFile,BufRead *.edn set filetype=clojure
  autocmd BufNewFile,BufRead *.cljs set filetype=clojure
  autocmd BufNewFile,BufRead *.cljx set filetype=clojure

  let g:paredit_leader= '\'
  let vimclojure#ParenRainbow  = 1

" Jade Highlighting"
  NeoBundle "digitaltoad/vim-jade.git"
  autocmd BufNewFile,BufRead *.jade set filetype=jade

" Scala Highlighting"
  NeoBundle "derekwyatt/vim-scala.git"
  autocmd BufNewFile,BufRead *.scala set filetype=scala

" Elixir plugin
  NeoBundle "elixir-lang/vim-elixir.git"
    au BufNewFile,BufRead *.ex set filetype=elixir
    au BufNewFile,BufRead *.exs set filetype=elixir

" Rust!
  NeoBundle 'wting/rust.vim.git'

" Easy async RSpec running
  NeoBundle 'thoughtbot/vim-rspec'
  NeoBundle "reshleman/vim-rspec.git"
  NeoBundle "tpope/vim-dispatch.git"
  let g:rspec_command = "Dispatch rspec --format=progress --no-profile {spec}"
  nmap <Leader>rc :wa<CR> :call RunCurrentSpecFile()<CR>
  nmap <Leader>rn :wa<CR> :call RunNearestSpec()<CR>
  nmap <Leader>rl :wa<CR> :call RunLastSpec()<CR>
  nmap <Leader>ra :wa<CR> :call RunAllSpecs()<CR>

 call neobundle#end()
