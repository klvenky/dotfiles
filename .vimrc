" Following command from line 2-6 is copied from vim-plug for autoinstallation
" of plugins. Ref: https://github.com/junegunn/vim-plug/wiki/tips#automatic-installation
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

filetype plugin indent on  		" Load plugins according to detected filetype.
syntax on                  		" Enable syntax highlighting.
set number				" shows line numbers
set wrapscan 				" wraps search around when reaches either end

" Plugins Section Starts here
call plug#begin('~/.vim/plugged')
" Add your plugins here. Format for that Plug "githubusername/repo-name"
Plug 'tpope/vim-fugitive' 		" A git wrapper for vim
Plug 'preservim/nerdtree' 		" A file browser for vim
Plug 'Xuyuanp/nerdtree-git-plugin' 	" A plugin for showing git status of a file/folder in nerdtree view

Plug 'wakatime/vim-wakatime' 		" Wakatime plugin to see my weekly coding activity in vim.
call plug#end()
" Plugins Section Ends here

let NERDTreeShowHidden=1 		" Shows hidden files from within NERDTree
colorscheme sublimemonokai
