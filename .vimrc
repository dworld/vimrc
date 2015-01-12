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
Plugin 'hallison/vim-ruby-sinatra'

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
syntax on

"Automatically remove trailing spaces when saving a file.
autocmd BufRead,BufWrite * if ! &bin | silent! %s/\s\+$//ge | endif

let g:neocomplete#enable_at_startup = 1

autocmd FileType ruby let g:SuperTabDefaultCompletionType = "<c-x><c-o>"

au BufRead,BufNewFile *.thrift set filetype=thrift
au! Syntax thrift source ~/.vim/thrift.vim

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

" key mapping
" ---------------------------------------------------------------------------
au FileType go nmap gd <Plug>(go-def)
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)

nmap <C-h> :CtrlPBuffer<CR>

