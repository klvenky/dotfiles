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
set autoindent					        	" Creates indents based on the previous line. Read from https://github.com/tpope/vim-sensible/blob/master/plugin/sensible.vim
set autoread						          " Automatically refreshes files for changes done by another program
set hidden						            " Switch between buffers without having to save first. Not clear on what this option really does. But could be helpful. Needs some thorough reading in depth
set hlsearch              				" Keep matches highlighted.
set incsearch          		   	 		" Highlight while searching with / or ?.
set number						            " shows line numbers
set showcmd					            	" Show already typed keys when more are expected.
" set ruler						            " shows the current cursor position. May not be required if a custom plugin like ale is used. Disabling as using vim-airline
set splitbelow
set splitright
set wrapscan 					          	" wraps search around when reaches either end

" Plugins Section Starts here
call plug#begin('~/.vim/plugged')
" Add your plugins here. Format for that Plug "githubusername/repo-name"
" Code Plugins. Not related to any programming language.
Plug 'tpope/vim-fugitive' 				           " A git wrapper for vim
Plug 'preservim/nerdtree' 				            " A file browser for vim
Plug 'Xuyuanp/nerdtree-git-plugin' 			      " A plugin for showing git status of a file/folder in nerdtree view
Plug 'wakatime/vim-wakatime' 				          " Wakatime plugin to see my weekly coding activity in vim.
Plug 'joshdick/onedark.vim'                   " One dark theme for Vim
Plug 'tpope/vim-commentary'				            " Adds shortcuts to add comments to files
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } 
Plug 'junegunn/fzf.vim'
" Plug 'sheerun/vim-polyglot'
" Plug 'airblade/vim-gitgutter'                 " Shows inline git modified/new details

" Generic Plugins irrespective of programming language
Plug 'vim-airline/vim-airline'	        			" Status bar for vim
Plug 'dense-analysis/ale'				              " Error notifier for vim

" All Programming language specific/dev-tools come here. 
" Ex: Linters, formatters, language servers etc
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' } 	" go language support for vim.
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }

call plug#end()
" Plugins Section Ends here
" All Plugin specific config for vim will load below to keep it clear
let NERDTreeShowHidden=1 		" Shows hidden files from within NERDTree
let g:NERDTreeWinPos = "left"
" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'
" Enables eslint for javascript
let g:ale_fixers = { 'javascript': ['eslint'] , 'typescript':['eslint'] }

let $FZF_DEFAULT_COMMAND = 'ag -g ""'         " This repo is used for skipping files in gitignore


" colorscheme sublimemonokai 		" Monokai color scheme
colorscheme onedark
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
" https://joshldavis.com/2014/04/05/vim-tab-madness-buffers-vs-tabs/
" Enable the list of buffers

" Golang specific configuration for vim-go plugin using (experimental settings) golang gopls
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'
let g:ale_linters = {'go': ['gopls'] } 			"  sends go lint output to ale
let g:go_fmt_command = "goimports"    			" Run goimports along gofmt on each save
let g:go_auto_type_info = 1           			" Automatically get signature/type info for object under cursor

let g:airline#extensions#tabline#enabled = 1

" Add shortcuts below
map <C-/> gcc
nnoremap <silent> <C-b> :NERDTreeToggle<CR>
nnoremap <C-p> :FZF<CR>
