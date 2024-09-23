" $VIMRUNTIME refers to the versioned system directory where Vim stores its
" system runtime files -- /usr/share/vim/vim<version>.
"
" Vim will load $VIMRUNTIME/defaults.vim if the user does not have a vimrc.
" This happens after /etc/vim/vimrc(.local) are loaded, so it will override
" any settings in these files.
"
" If you don't want that to happen, uncomment the below line to prevent
" defaults.vim from being loaded.
" let g:skip_defaults_vim = 1
"
" If you would rather _use_ default.vim's settings, but have the system or
" user vimrc override its settings, then uncomment the line below.
" source $VIMRUNTIME/defaults.vim

" All Debian-specific settings are defined in $VIMRUNTIME/debian.vim and
" sourced by the call to :runtime you can find below.  If you wish to change
" any of those settings, you should do it in this file or
" /etc/vim/vimrc.local, since debian.vim will be overwritten everytime an
" upgrade of the vim packages is performed. It is recommended to make changes
" after sourcing debian.vim so your settings take precedence.
"

" ------------------------------------------------------------------------------------------------
" 显示行号
set number

" 高亮当前行
set cursorline

" 语法高亮
syntax on

" 开启自动缩进
set autoindent
set smartindent

" 设置Tab键为4个空格
set tabstop=4
set shiftwidth=4
set expandtab

" 搜索时忽略大小写
set ignorecase
set smartcase

" 显示匹配的括号
set showmatch

" 禁用兼容模式，启用Vim的高级特性
set nocompatible

" 在编辑时保留一部分屏幕上下文
set scrolloff=8

" 显示命令的执行结果
set showcmd

" 高亮搜索结果
set hlsearch

" 增量搜索
set incsearch

" ------------------------------------------------------------------------------------------------
call plug#begin('~/.vim/plugged')

" 常用插件推荐
Plug 'preservim/nerdtree'  " 文件树
command! Tree NERDTree

Plug 'junegunn/fzf.vim'    " 模糊搜索
Plug 'tpope/vim-commentary' " 快速注释
Plug 'vim-airline/vim-airline' " 状态栏美化
Plug 'jiangmiao/auto-pairs' " 自动补括号
Plug 'ycm-core/YouCompleteMe'  " 代码自动补全
Plug 'neoclide/coc.nvim', {'branch': 'release'} " 代码补全

call plug#end()

" ------------------------------------------------------------------------------------------------
runtime! debian.vim

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes
" numerous options, so any other options should be set AFTER changing
" 'compatible'.
"set compatible

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
if has("syntax")
  syntax on
endif

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
"set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
"au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
"filetype plugin indent on

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
"set showcmd		" Show (partial) command in status line.
"set showmatch		" Show matching brackets.
"set ignorecase		" Do case insensitive matching
"set smartcase		" Do smart case matching
"set incsearch		" Incremental search
"set autowrite		" Automatically save before commands like :next and :make
"set hidden		" Hide buffers when they are abandoned
"set mouse=a		" Enable mouse usage (all modes)

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

