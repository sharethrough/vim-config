" Need to do this first so all the shortcuts work
let mapleader = ','

" Plugins are managed by NeoBundle. Once VIM is open run :NeoBundleInstall to
" install plugins.
 call neobundle#begin(expand('~/.vim/bundle/'))

 " Let NeoBundle manage NeoBundle
 NeoBundleFetch 'Shougo/neobundle.vim'

" Plugins requiring no additional configuration or keymaps
  NeoBundle 'pangloss/vim-javascript'
  NeoBundle 'tomtom/tcomment_vim'
  NeoBundle 'tpope/vim-endwise'
  NeoBundle 'tpope/vim-fugitive'
  NeoBundle 'tpope/vim-haml'
  NeoBundle 'tpope/vim-rake'
  NeoBundle 'tpope/vim-repeat'
  NeoBundle 'vim-ruby/vim-ruby'
  NeoBundle 'vim-scripts/L9'
  NeoBundle 'vim-scripts/matchit.zip'
  NeoBundle 'vim-scripts/ruby-matchit'
  NeoBundle 'tpope/vim-abolish'
  NeoBundle 'airblade/vim-gitgutter'
  NeoBundle 'scssquatch/vim-css-color'
  NeoBundle 'tpope/vim-sleuth'

 " Vim airline configs
  NeoBundle 'bling/vim-airline'
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
  NeoBundle 'Lokaltog/vim-easymotion'

" Supertab code completion
  NeoBundle 'ervandew/supertab'
  let g:SuperTabContextDefaultCompletionType = '<c-n>'

" Dash Searching
  NeoBundle 'rizzatti/funcoo.vim'
  NeoBundle 'rizzatti/dash.vim'
    nmap <Leader>qs <Plug>DashSearch
    nmap <Leader>qa <Plug>DashGlobalSearch
    nmap <leader>q* <Plug>DashSearch

" CtrlP
  NeoBundle 'ctrlpvim/ctrlp.vim'
    nnoremap <Leader>b :<C-U>CtrlPBuffer<CR>
    nnoremap <Leader>t :<C-U>CtrlP<CR>
    nnoremap <Leader>T :<C-U>CtrlPTag<CR>
    map <Leader>cpc :CtrlPClearCache<CR>

    " The Silver Searcher
    if executable('ag')
      " Use ag over grep
      set grepprg=ag\ --nogroup\ --nocolor

      " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
      let g:ctrlp_user_command = "ag %s -l --nocolor -g ''"

      " ag is fast enough that CtrlP doesn't need to cache
      let g:ctrlp_use_caching = 0
    endif

" Less
  NeoBundle 'groenewege/vim-less'
    au BufNewFile,BufRead *.less set filetype=less

" Handlebars, Mustache, and Friends
  NeoBundle 'mustache/vim-mustache-handlebars'
  au  BufNewFile,BufRead *.mustache,*.handlebars,*.hbs,*.hogan,*.hulk,*.hjs set filetype=html syntax=mustache | runtime! ftplugin/mustache.vim ftplugin/mustache*.vim ftplugin/mustache/*.vim

" Coffee script
  NeoBundle 'kchmck/vim-coffee-script'
    au BufNewFile,BufRead *.coffee set filetype=coffee

" AG aka The Silver Searcher
  NeoBundle 'rking/ag.vim'
    nmap g/ :Ag!<space>
    nmap g* :Ag! -w <C-R><C-W><space>
    nmap ga :AgAdd!<space>
    nmap gn :cnext<CR>
    nmap gp :cprev<CR>
    nmap gl :cwindow<CR>

" STR ag commands
    nnoremap <leader>ag :Ag<space>

" Tagbar for navigation by tags using CTags
  NeoBundle 'majutsushi/tagbar'
    let g:tagbar_autofocus = 1
    map <Leader>rt :!ctags --extra=+f -R *<CR><CR>
    map <Leader>. :TagbarToggle<CR>
    map <C-\> :tnext<CR>

" Markdown syntax highlighting
  NeoBundle 'tpope/vim-markdown'
    augroup mkd
      autocmd BufNewFile,BufRead *.mkd      set ai formatoptions=tcroqn2 comments=n:> filetype=markdown
      autocmd BufNewFile,BufRead *.md       set ai formatoptions=tcroqn2 comments=n:> filetype=markdown
      autocmd BufNewFile,BufRead *.markdown set ai formatoptions=tcroqn2 comments=n:> filetype=markdown
    augroup END

" NERDTree for project drawer
  NeoBundle 'scrooloose/nerdtree'
    let NERDTreeHijackNetrw = 0
    let NERDTreeIgnore=['\.rbc$', '\~$']
    nmap <leader>g :NERDTreeToggle<CR>
    nmap <leader>G :NERDTreeFind<CR>
    map <Leader>nt :NERDTreeToggle<CR>

" Tabular for aligning text
  NeoBundle 'godlygeek/tabular'
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
  NeoBundle 'vim-scripts/ZoomWin'
    map <Leader>z :ZoomWin<CR>
    map <Leader><Leader> :ZoomWin<CR>

" Unimpaired for keymaps for quicky manipulating lines and files
  NeoBundle 'tpope/vim-unimpaired'
    " Bubble single lines
    nmap <C-Up> [e
    nmap <C-Down> ]e

    " Bubble multiple lines
    vmap <C-Up> [egv
    vmap <C-Down> ]egv

" gundo for awesome undo tree visualization
  NeoBundle 'sjl/gundo.vim'
    map <Leader>h :GundoToggle<CR>

" rails.vim, nuff' said
  NeoBundle 'tpope/vim-rails'
    map <Leader>oc :Econtroller<Space>
    map <Leader>ov :Eview<Space>
    map <Leader>om :Emodel<Space>
    map <Leader>oh :Ehelper<Space>
    map <Leader>oj :Ejavascript<Space>
    map <Leader>os :Estylesheet<Space>
    map <Leader>oi :Eintegration<Space>
    " John Papa recommended angular naming conventions
    let g:rails_projections = {
      \  'app/assets/*.js.coffee': {
      \     'alternate': 'spec/{}.spec.js.coffee'
      \   },
      \  'app/assets/*.js': {
      \     'alternate': 'spec/{}.spec.js'
      \   },
      \  'app/assets/*.coffee': {
      \     'alternate': 'spec/{}.spec.coffee'
      \   },
      \  'spec/*.spec.js.coffee': {
      \     'alternate': 'app/assets/{}.js.coffee'
      \   },
      \  'spec/*.spec.js': {
      \     'alternate': 'app/assets/{}.js'
      \   },
      \  'spec/*.spec.coffee': {
      \     'alternate': 'app/assets/{}.coffee'
      \   }
      \}

" surround for adding surround 'physics'
  NeoBundle 'tpope/vim-surround'
    " # to surround with ruby string interpolation
    let g:surround_35 = '#{\r}'
    " - to surround with no-output erb tag
    let g:surround_45 = '<% \r %>'
    " = to surround with output erb tag
    let g:surround_61 = '<%= \r %>'

" Scala Highlighting
  NeoBundle 'derekwyatt/vim-scala'
  autocmd BufNewFile,BufRead *.scala set filetype=scala

" Easy async RSpec running
  NeoBundle 'thoughtbot/vim-rspec'
  NeoBundle 'tpope/vim-dispatch'
  let g:rspec_command = 'bundle exec rspec --format=progress --no-profile {spec}'
  nmap <Leader>rc :wa<CR> :call RunCurrentSpecFile()<CR>
  nmap <Leader>rn :wa<CR> :call RunNearestSpec()<CR>
  nmap <Leader>rl :wa<CR> :call RunLastSpec()<CR>
  nmap <Leader>ra :wa<CR> :call RunAllSpecs()<CR>

 call neobundle#end()
