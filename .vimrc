" My Vimrc file
" Maintainer: swaroop@swaroopch.com

"" Vim, not Vi.
" This must be first, because it changes other options as a side effect.
set nocompatible
set number
let mapleader = ","
let maplocalleader = "."
" required! by vundle
filetype off

"" Vundle
"" See :help vundle for more details
set runtimepath+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! by vundle
Bundle 'gmarik/vundle'

" Git Repos by http://vim-scripts.org ( get names from https://github.com/vim-scripts/following )
"Bundle 'Conque-Shell'
"Bundle 'JSON.vim'
"Bundle 'NrrwRgn'
"Bundle 'calendar.vim--Matsumoto'
"Bundle 'django.vim'
"Bundle 'nginx.vim'
"Bundle 'python.vim--Vasiliev'
"Bundle 'utl.vim'
Bundle 'VimClojure'
Bundle 'paredit.vim'

" Bundle 'kchmck/vim-coffee-script'
Bundle 'fatih/vim-go'
Bundle 'quitejs/vim-coffee-script'
" Git Repos on GitHub
" Inspired from http://sontek.net/turning-vim-into-a-modern-python-ide
"Bundle 'AD7six/vim-independence'
"Bundle 'Lokaltog/vim-easymotion'
"Bundle 'Lokaltog/vim-powerline'
"Bundle 'altercation/vim-colors-solarized'
"Bundle 'chriskempson/vim-tomorrow-theme'
"Bundle 'fuenor/vim-wordcount'
"Bundle 'godlygeek/tabular'
"Bundle 'hsitz/VimOrganizer'
"Bundle 'mattn/zencoding-vim'
"Bundle 'nathanaelkane/vim-indent-guides'
"Bundle 'roman/golden-ratio'
"Bundle 'sjl/gundo.vim'
"Bundle 'swaroopch/vim-markdown'
"Bundle 'tpope/vim-speeddating'
"Bundle 'tpope/vim-surround'
"Bundle 'tpope/vim-unimpaired'
"Bundle 'davidhalter/jedi-vim'
Bundle 'chriskempson/vim-tomorrow-theme'
Bundle 'gmarik/ide-popup.vim'
Bundle 'juvenn/mustache.vim'
Bundle 'kien/ctrlp.vim'
Bundle 'mileszs/ack.vim'
Bundle 'msanders/snipmate.vim'
Bundle 'nvie/vim-flake8'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
Bundle 'sukima/xmledit'
Bundle 'swaroopch/vim-markdown-preview'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-git'
Bundle 'vim-pandoc/vim-pandoc'
"my addon
Bundle 'slim-template/vim-slim'
Bundle 'tpope/vim-rails'
Bundle 'wavded/vim-stylus'
"Bundle 'esukram/vim-taglist'
Bundle 'digitaltoad/vim-jade'
Bundle 'tpope/vim-markdown'
Bundle 'mintplant/vim-literate-coffeescript'
Bundle 'vim-scripts/VimIM'
Bundle 'mjbrownie/browser.vim'
Bundle 'michael-lu-cn/dbext.vim'
Bundle 'tomtom/tcomment_vim'
Bundle 'Yggdroot/indentLine'
Bundle 'myusuf3/numbers.vim'
Bundle 'goatslacker/mango.vim'
Bundle 'majutsushi/tagbar'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'junegunn/vim-redis'
" Bundle 'file:///home/michael/github/todo.txt-vim'
Bundle 'freitass/todo.txt-vim'
Bundle 'mhinz/vim-grepper'
Bundle 'lukaszkorecki/CoffeeTags'
Bundle "tacahiroy/ctrlp-funky"
" Bundle 'Valloric/YouCompleteMe'
" Bundle '~/github/YouCompleteMe/.git'
"Bundle 'flazz/vim-colorschemes'
" Git Repos not on GitHub
"Bundle 'git://git.wincent.com/command-t.git'

"" General Settings

" Enable syntax highlighting.
syntax on

" Line endings should be Unix-style unless the file is from someone else.
set fileformat=unix
au BufNewFile * set fileformat=unix

" Automatically indent when adding a curly bracket, etc.
" required! by vundle
"filetype plugin indent on
set autoindent
set smartindent
set mouse=a

" Tabs converted to 4 spaces
set shiftwidth=2
set tabstop=2
set expandtab
set smarttab
set backspace=indent,eol,start

" Set up backup dir where the swap files are stored
"set dir=~/.vim/backup,~/tmp,/tmp
"set backupdir=~/.vim/backup,~/tmp,/tmp

" Disable the F1 help key
map <F1> <Esc>
imap <F1> <Esc>

" Show special characters
if v:version >= 700
    set list listchars=tab:>-,trail:.,extends:>,nbsp:_
else
    set list listchars=tab:>-,trail:.,extends:>
endif

" Don't break up long lines, but visually wrap them.
set textwidth=0
set wrap

" Text mode
command TextMode setlocal nolist wrap linebreak scrolloff=999

" Highlight current line
"set cursorline

" http://vim.wikia.com/wiki/Move_cursor_by_display_lines_when_wrapping
nnoremap <silent> j gj
nnoremap <silent> k gk
vnoremap <silent> j gj
vnoremap <silent> k gk

" Minimal number of screen lines to keep above and below the cursor.
" This keeps the cursor always in the vertical middle of the screen.
set scrolloff=999

" Use UTF-8
set encoding=utf-8

" Status line
set laststatus=2
set statusline=
set statusline+=%-3.3n\                         " buffer number
set statusline+=%f\                             " filename
set statusline+=%h%m%r%w                        " status flags
if isdirectory(expand("~/.vim/bundle/vim-fugitive", ":p"))
    set statusline+=%{fugitive#statusline()}        " git status
endif
if isdirectory(expand("~/.vim/bundle/syntastic", ":p"))
    set statusline+=%{SyntasticStatuslineFlag()}    " syntastic status - makes sense with :Errors
endif
set statusline+=\[%{strlen(&ft)?&ft:'none'}]    " file type
set statusline+=%=                              " right align remainder
set statusline+=0x%-8B                          " character value
set statusline+=%-14(%l,%c%V%)                  " line, character
set statusline+=%<%P                            " file position

" Tab line
" Refer ':help setting-guitablabel'
function GuiTabLabel()
    let label = ''
    let bufnrlist = tabpagebuflist(v:lnum)

    " Add '+' if one of the buffers in the tab page is modified
    for bufnr in bufnrlist
        if getbufvar(bufnr, '&modified')
            let label = '[+] '
            break
            break
        endif
    endfor

    " Append the number of windows in the tab page if more than one
    let wincount = tabpagewinnr(v:lnum, '$')
    if wincount > 1
        let label .= wincount
    endif
    if label != ''
        let label .= ' '
    endif

    return label

endfunction

set guitablabel=%{GuiTabLabel()}\ %t

" Show line number, cursor position.
set ruler

" Display incomplete commands.
set showcmd

" Search as you type.
set incsearch

" Ignore case while searching
set ignorecase

" Make /g flag default when doing :s
set gdefault

" Show autocomplete menus
set wildmenu

" Show editing mode
set showmode

" Ignore certain filetypes when doing filename completion
set wildignore=*.sw*,*.pyc,*.bak

" Show matching brackets
set showmatch

" Bracket blinking
set matchtime=2

" Split new window below current one
set splitbelow

" Error bells are displayed visually.
set visualbell

" Automatically read files which have been changed outside of Vim, if we
" haven't changed it already.
set autoread

" Disable highlighting after search. Too distracting.
set nohlsearch

" To save, ctrl-s.
nmap <c-s> :w<CR>
imap <c-s> <Esc>:w<CR>a

" Reformatting options. See `:help fo-table`
set formatoptions+=lnor1

" Disable spellcheck by default
set nospell
autocmd BufRead,BufNewFile * setlocal nospell
" To enable again, use:
" setlocal spell spelllang=en_us

" Say a message
function! Say(msg)
    echohl IncSearch
    echo a:msg
    echohl None
endfunction

" Copy full buffer to OS clipboard.
function! CopyAll()
    normal mzggVG"+y'z
    call Say("Copied.")
endfunction
command A call CopyAll()

" Delete buffer contents and Paste from OS clipboard.
function! PasteFromClipboard()
    normal ggVGd"+p1G
    call Say("Pasted.")
endfunction
command B call PasteFromClipboard()

" Markdown files are plain text files
autocmd FileType markdown TextMode
autocmd FileType pandoc TextMode
let g:pandoc_no_folding = 1
" Allow these file extensions to be accessed via 'gf' of only the name, for
" e.g. gf on [[AnotherPage]] should go to AnotherPage.pd
set suffixesadd=.pd,.txt

if has('python') " Assumes Python >= 2.6

    " Quick way to open a filename under the cursor in a new tab
    " (or URL in a browser)
    function! Open()
python <<EOF
import re
import platform
import vim

def launch(uri):
    if platform.system() == 'Darwin':
        vim.command('!open {}'.format(uri))
    elif platform.system() == 'Linux':
        vim.command('!firefox -new-tab {}'.format(uri))

def is_word(text):
    return re.match(r'^[\w./?%:#&=~+-]+$', text) is not None

filename_start = filename_end = vim.current.window.cursor[1] # (row, col)

while filename_start >= 0 and is_word(vim.current.line[filename_start:filename_start+1]):
    filename_start -= 1
filename_start += 1

while filename_end <= len(vim.current.line) and is_word(vim.current.line[filename_end:filename_end+1]):
    filename_end += 1

filename = vim.current.line[filename_start:filename_end]

if filename.endswith('.md') or filename.endswith('.txt'):
    vim.command('tabedit {0}'.format(filename))

elif filename.lower().startswith('http') or filename.lower().startswith('www.'):
    if filename.lower().startswith('www.'):
        filename = 'http://{0}'.format(filename)
    filename = filename.replace('#', r'\#').replace('%', r'\%').replace('~', r'\~')
    launch(filename)

else:
    launch(filename)
EOF

    endfunction

    command O call Open()
    map <Leader>o :call Open()<CR>

" Add the virtualenv's site-packages to vim path
python << EOF
import os.path
import sys
import vim
if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    sys.path.insert(0, project_base_dir)
    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
    execfile(activate_this, dict(__file__=activate_this))
EOF

endif " python

" Remove the Windows ^M (copied from http://amix.dk/vim/vimrc.html)
map <Leader>d mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" See `:help key-notation`
" Shortcuts for moving between tabs
" Alt-j to move to the tab to the left
noremap <A-j> :tabN<CR>
noremap <D-j> :tabN<CR>
" Alt-k to move to the tab to the right
noremap <A-k> :tabn<CR>
noremap <D-k> :tabn<CR>

" Shortcut for moving between windows
nnoremap <c-j> :wincmd w<CR>

" Shortcut to insert date
inoremap <F5> <C-R>=strftime("%a, %d %b %Y")<CR>

" http://items.sjbach.com/319/configuring-vim-right
" Marks
nnoremap ' `
nnoremap ` '

" matchit
runtime! macros/matchit.vim

" Python
let python_highlight_all=1
" PEP8 compliance - http://www.python.org/dev/peps/pep-0008/
autocmd FileType python set colorcolumn=80

"" Bundle-specific configurations

" Bundle 'VimClojure'
let g:vimclojure#ParenRainbow = 1

" Bundle 'godlygeek/tabular'
"command -range AlignFirstEquals :<line1>,<line2>Tabularize /^[^=]*\zs/
"command -range AlignFirstColon  :<line1>,<line2>Tabularize /^[^:]*\zs/

" Bundle 'scrooloose/nerdtree'
"let NERDTreeIgnore=['\.pyc$', '\.rbc$', '\~$']
"map <Leader>n :NERDTreeToggle<CR>

" Bundle 'mileszs/ack.vim'
" nmap <Leader>a <Esc>:Ack!<space>

" Bundle 'tpope/vim-fugitive'
" http://vimcasts.org/blog/2011/05/the-fugitive-series/
autocmd BufReadPost fugitive://* set bufhidden=delete

" Bundle 'scrooloose/syntastic'
let g:syntastic_enable_signs=1

" XML, HTML
function TagExpander()
    if exists("b:did_ftplugin")
      unlet b:did_ftplugin
    endif
    runtime! ftplugin/xml.vim ftplugin/xml_*.vim ftplugin/xml/*.vim
endfunction

autocmd FileType xml   call TagExpander()
autocmd FileType html  call TagExpander()
autocmd FileType eruby call TagExpander()
autocmd FileType htmljinja call TagExpander()
autocmd FileType htmldjango call TagExpander()

" Ruby
autocmd BufRead,BufNewFile {Gemfile,Rakefile,config.ru} setlocal ft=ruby
autocmd FileType ruby setlocal tabstop=2 shiftwidth=2

" YAML
autocmd FileType yaml setlocal tabstop=2 shiftwidth=2

" JSON
"autocmd BufRead,BufNewFile *.json setlocal ft=json foldmethod=syntax
autocmd FileType json setlocal tabstop=2 shiftwidth=2

" Clojure
autocmd FileType clojure setlocal tabstop=2 shiftwidth=2

" Sudo to write
cmap w!! w !sudo tee % >/dev/null

" Assume Bash is my shell (:help sh.vim)
let g:is_bash = 1

" Reload all windows in all tabs, useful after I do a 'git rebase -i'
command Reedit :tabdo windo edit!

" Default color scheme
set background=dark

" NOTE: On Mac OS X, best used with [iTerm 2](http://www.iterm2.com)
if isdirectory(expand("~/.vim/bundle/vim-tomorrow-theme", ":p"))
    colorscheme Tomorrow-Night
endif

" Mac
if has('mac')
    set macmeta
endif

" Local config
let vimrc_local = expand("~/.vimrc.local", ":p")
if filereadable(vimrc_local)
    execute 'source' vimrc_local
endif
unlet vimrc_local

" vim: filetype=vim

"configure ctrlp
let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<c-t>'],
    \ 'AcceptSelection("t")': ['<cr>', '<2-LeftMouse>'],
    \ }

inoremap jjw <Esc>:w<CR>
inoremap jjs <Esc>:wq<CR>
inoremap jj <Esc>
nnoremap : :w<CR>
nnoremap ss :wq<CR>
noremap ; :
nnoremap th  :tabfirst<CR>
nnoremap tj  :tabnext<CR>
nnoremap tk  :tabprev<CR>
nnoremap tl  :tablast<CR>
nnoremap tt  :tabedit<Space>
nnoremap tn  :tabnext<Space>
nnoremap tm  :tabm<Space>
nnoremap td  :tabclose<CR>
noremap <F6> :w<CR>:!ruby %<CR>
noremap <F8> :w<CR>:!coffee %<CR>
noremap <F7> :w<CR>:!node %<CR>
noremap <c-j> <c-w>j
noremap <c-k> <c-w>k
noremap <c-h> <c-w>h
noremap <c-l> <c-w>l
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
let Tlist_Use_Right_Window = 1
autocmd BufWritePost *.cpp :TlistUpdate

if executable('coffeetags')
  let g:tagbar_type_coffee = {
        \ 'ctagsbin' : 'coffeetags',
        \ 'ctagsargs' : '',
        \ 'kinds' : [
        \ 'f:functions',
        \ 'o:object',
        \ ],
        \ 'sro' : ".",
        \ 'kind2scope' : {
        \ 'f' : 'object',
        \ 'o' : 'object',
        \ }
        \ }
endif

nnoremap ct :TagbarToggle<CR>
nnoremap tt :NERDTreeToggle<CR>
" autocmd VimEnter * nested :call tagbar#autoopen(1)
" autocmd FileType * nested :call tagbar#autoopen(0)
" autocmd BufEnter * nested :call tagbar#autoopen(0)

inoremap ' "
inoremap " '
nnoremap ' "
nnoremap " '
inoremap Mes module.exports<space>=
inoremap == yield from<space>
inoremap z= <space>= yield from<space>
inoremap f= : = <CR>run: =><CR><CR><backspace><backspace>
au BufNewFile,BufReadPost *.coffee setl foldmethod=indent nofoldenable
au BufReadPost *.cf set filetype=coffee
" SQLite
 let g:dbext_default_SQLITE_bin = 'sqlite3'
 let g:dbext_default_profile_sqlite_hanzi  = 'type=SQLITE:dbname=~/wen/demo/main/hanzi.db'
 let g:dbext_default_profile_sqlite_android  = 'type=SQLITE:dbname=~/wen/demo/yuewen/android.db'
 let g:dbext_default_profile_sqlite_library = 'type=SQLITE:dbname=~/library/library.db'
"  let g:dbext_default_profile_postgres_hanzi = 'type=PGSQL:user=postgres:dbname=dvdrental'
 let g:dbext_default_profile_postgres_sample = 'type=PGSQL:user=michael:dbname=camp_debug'
 let g:dbext_default_profile_mysql_fittime  = 'type=MYSQL:user=root:dbname=rjfittime_dev'
"  let g:dbext_default_profile  = 'sqlite_hanzi'
 let g:dbext_default_profile  = 'postgres_sample'
"  let g:dbext_default_profile  = 'mysql_fittime'
"  let g:dbext_default_profile  = 'sqlite_android'

"Vimscript file settings----------{{{
augroup filetype_vim
  autocmd!
  autocmd FileType vim setlocal foldmethod=marker
augroup END
"}}}

set pastetoggle=<leader>p
color mango
color Tomorrow-Night-Eighties

map  / <Plug>(easymotion-sn)
map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-linebackward)
map <Leader>w <Plug>(easymotion-w)
map <Leader>b <Plug>(easymotion-b)
map <Leader>f <Plug>(easymotion-f)
map <Leader>s <Plug>(easymotion-s)

" nnoremap p "+p
" nnoremap y "+y
" nnoremap d "+d
" nnoremap yy "+yy
" nnoremap dd "+dd

nnoremap <Leader>g :Grepper<CR>
nnoremap nf :NERDTreeFind<CR>

set scrolloff=7
set cursorline
set cursorcolumn
:nnoremap <Leader>r :%s/\<<C-r><C-w>\>//g<Left><Left>
set clipboard=unnamed
"" Redis connection information
" let g:vim_redis_host = 'localhost'
" let g:vim_redis_port = '6379'
" let g:vim_redis_auth = 'xxx'

"" Output window on bottom (default: right)
" let g:vim_redis_output_position = 'b'

"" Paste command on output window
let g:vim_redis_paste_command = 1
let g:vim_redis_paste_command_prefix = '> '

" Execute Redis command on the current line
nnoremap  <leader>te :RedisExecute<cr>

" Execute commands on multiple lines at once while in visual mode
vnoremap <slient> <leader>te :RedisExecuteVisual<cr>gv

" Clear output window
noremap <slient> <leader>rw :RedisWipe<cr>

" Close output window
noremap <slient> <leader>rq :RedisQuit<cr>
set noswapfile

"" Mappings with connection info (host, port, auth)
" noremap  <slient> <leader>re :RedisExecute localhost 6379 xxx<cr>
" vnoremap <slient> <leader>re :RedisExecute localhost 6379 xxx<cr>gv
