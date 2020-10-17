" Following command from line 2-6 is copied from vim-plug for autoinstallation
" of plugins. Ref: https://github.com/junegunn/vim-plug/wiki/tips#automatic-installation
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

filetype plugin indent on  				" Load plugins according to detected filetype.
syntax on                  				" Enable syntax highlighting.
set number						" shows line numbers
set wrapscan 						" wraps search around when reaches either end
set showcmd						" Show already typed keys when more are expected.
set incsearch          		   	 		" Highlight while searching with / or ?.
set hlsearch              				" Keep matches highlighted.
set autoindent						" Creates indents based on the previous line. Read from https://github.com/tpope/vim-sensible/blob/master/plugin/sensible.vim
" set ruler						" shows the current cursor position. May not be required if a custom plugin like ale is used. Disabling as using vim-airline

" Plugins Section Starts here
call plug#begin('~/.vim/plugged')
" Add your plugins here. Format for that Plug "githubusername/repo-name"
" Code Plugins. Not related to any programming language.
Plug 'tpope/vim-fugitive' 				" A git wrapper for vim
Plug 'preservim/nerdtree' 				" A file browser for vim
Plug 'Xuyuanp/nerdtree-git-plugin' 			" A plugin for showing git status of a file/folder in nerdtree view
Plug 'wakatime/vim-wakatime' 				" Wakatime plugin to see my weekly coding activity in vim.
Plug 'kien/ctrlp.vim'					" Ctrl+P functionality for vim for picking files in the current project


Plug 'vim-airline/vim-airline'				" Status bar for vim

" All Programming language specific/dev-tools come here. 
" Ex: Linters, formatters, language servers etc
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' } 	" go language support for vim.



call plug#end()
" Plugins Section Ends here
" All Plugin specific config for vim will load below to keep it clear
let NERDTreeShowHidden=1 		" Shows hidden files from within NERDTree
colorscheme sublimemonokai
