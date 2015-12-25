" Vundle
" ---------------------------------------------------------------------------
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'SirVer/ultisnips'

Plugin 'kien/ctrlp.vim'
Plugin 'Shougo/neocomplete'
Plugin 'nsf/gocode', {'rtp': 'vim/'}
Plugin 'fatih/vim-go'
Plugin 'adamclerk/vim-razor'
Plugin 'pangloss/vim-javascript'
Plugin 'myint/indent-finder'
Plugin 'majutsushi/tagbar'
Plugin 'ervandew/supertab'
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-rails'
Plugin 'ponzellus/AnsiEsc'
"Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-gitgutter'
Plugin 'bling/vim-airline'
Plugin 'nanotech/jellybeans.vim'
Plugin 'Yggdroot/indentLine'
Plugin 'KurtPreston/vim-autoformat-rails'
Plugin 'solarnz/thrift.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" self settings
" ---------------------------------------------------------------------------
syntax on
set nowrap
set nu ai
set ts=4 sw=4
set completeopt-=preview
set bg=dark
set clipboard=unnamed
set noswapfile

syntax on
colorscheme jellybeans

" let g:syntastic_debug = 1
let g:indentLine_color_term = 236

"Automatically remove trailing spaces when saving a file.
autocmd BufRead,BufWrite * if ! &bin | silent! %s/\s\+$//ge | endif

let g:neocomplete#enable_at_startup = 1
" let g:airline#extensions#tabline#enabled = 1

au FileType ruby let g:SuperTabDefaultCompletionType = "<c-x><c-o>"
" au BufWrite *.rb :silent! call AutoFormatRails()<CR>

" vim-go settings
" ---------------------------------------------------------------------------
let g:go_disable_autoinstall = 1
let g:go_fmt_command = "goimports"
" let g:go_auto_type_info = 1

" tagbar
let g:tagbar_left = 1
nmap <F8> :TagbarToggle<CR>
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
	\ }

" syntastic
" ---------------------------------------------------------------------------
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_enable_java_checker = 0
" let g:syntastic_ruby_checkers = ['mri']
au FileType go let g:syntastic_auto_loc_list = 0

" key mapping
" ---------------------------------------------------------------------------
au FileType go nmap gd <Plug>(go-def)
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)

autocmd filetype crontab setlocal nobackup nowritebackup

nmap <C-h> :CtrlPBuffer<CR>
nmap <C-y> :NERDTreeToggle<CR>
