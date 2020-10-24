" Following command from line 2-6 is copied from vim-plug for autoinstallation
" of plugins. Ref: https://github.com/junegunn/vim-plug/wiki/tips#automatic-installation
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Basic configuration for file editing & basi vim usage
filetype plugin indent on  				" Load plugins according to detected filetype.
syntax on                  				" Enable syntax highlighting.
set number						" shows line numbers
set wrapscan 						" wraps search around when reaches either end
set showcmd						" Show already typed keys when more are expected.
set incsearch          		   	 		" Highlight while searching with / or ?.
set hlsearch              				" Keep matches highlighted.
set autoindent						" Creates indents based on the previous line. Read from https://github.com/tpope/vim-sensible/blob/master/plugin/sensible.vim
" set ruler						" shows the current cursor position. May not be required if a custom plugin like ale is used. Disabling as using vim-airline
set hidden						" Switch between buffers without having to save first. Not clear on what this option really does. But could be helpful. Needs some thorough reading in depth
set autoread						" Automatically refreshes files for changes done by another program


" Plugins Section Starts here
call plug#begin('~/.vim/plugged')
" Add your plugins here. Format for that Plug "githubusername/repo-name"
" Code Plugins. Not related to any programming language.
Plug 'tpope/vim-fugitive' 				" A git wrapper for vim
Plug 'preservim/nerdtree' 				" A file browser for vim
Plug 'Xuyuanp/nerdtree-git-plugin' 			" A plugin for showing git status of a file/folder in nerdtree view
Plug 'wakatime/vim-wakatime' 				" Wakatime plugin to see my weekly coding activity in vim.
Plug 'kien/ctrlp.vim'					" Ctrl+P functionality for vim for picking files in the current project

" Generic Plugins irrespective of programming language
Plug 'vim-airline/vim-airline'				" Status bar for vim
Plug 'dense-analysis/ale'				" Error notifier for vim


" All Programming language specific/dev-tools come here. 
" Ex: Linters, formatters, language servers etc
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' } 	" go language support for vim.



call plug#end()
" Plugins Section Ends here
" All Plugin specific config for vim will load below to keep it clear
let NERDTreeShowHidden=1 		" Shows hidden files from within NERDTree
let g:NERDTreeWinPos = "left"
colorscheme sublimemonokai 		" Monokai color scheme


" Golang specific configuration for vim-go plugin using (experimental settings) golang gopls
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'
let g:ale_linters = {'go': ['gopls'] } 			"  sends go lint output to ale
let g:go_fmt_command = "goimports"    			" Run goimports along gofmt on each save
let g:go_auto_type_info = 1           			" Automatically get signature/type info for object under cursor

" Places all temporary files under the same directory.
" https://github.com/mhinz/vim-galore#handling-backup-swap-undo-and-viminfo-files
" Saving might fail for the first time when the setup is done. 
" This can be because by default the files folder doesn't exist
" set backup
" set backupdir   =$HOME/.vim/files/backup/
" set backupext   =-vimbackup
" set backupskip  =
" set directory   =$HOME/.vim/files/swap/
" set updatecount =100
" set undofile
" set undodir     =$HOME/.vim/files/undo/
" set viminfo     ='100,n$HOME/.vim/files/info/viminfo

