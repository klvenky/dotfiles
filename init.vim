" Install Vim Plug if not installed
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

filetype plugin indent on  							" Load plugins according to detected filetype.
set splitright
set splitbelow
set number									" shows line numbers
set autoread									" automatically reads updates on disk

" Add all plugins in the below section
call plug#begin("~/.vim/plugged")
	" Plug 'tpope/vim-fugitive' 				           	" A git wrapper for vim
	" Plug 'preservim/nerdtree' 				            	" A file browser for vim
	" Plug 'Xuyuanp/nerdtree-git-plugin' 			      		" A plugin for showing git status of a file/folder in nerdtree view
	Plug 'wakatime/vim-wakatime' 				          	" Wakatime plugin to see my weekly coding activity in vim.
	Plug 'tomasiser/vim-code-dark'						" VSCode Default dark theme
	Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } 
	Plug 'junegunn/fzf.vim'
	Plug 'airblade/vim-gitgutter'                 				" Shows inline git modified/new details
	Plug 'preservim/nerdcommenter'						" A much more powerful code commenting tool
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
	
	" Generic Plugins irrespective of programming language
	Plug 'vim-airline/vim-airline'	        				" Status bar for vim
	Plug 'dense-analysis/ale'				              	" Error notifier for vim
	
	" All Programming language specific/dev-tools come here. 
	" Ex: Linters, formatters, language servers etc
	Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' } 	" go language support for vim.
	Plug 'pangloss/vim-javascript'
	Plug 'leafgarland/typescript-vim'
	Plug 'peitalin/vim-jsx-typescript'
	Plug 'prettier/vim-prettier', { 'do': 'yarn install', 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }
	
call plug#end()
" colorscheme sublimemonokai 		" Monokai color scheme
" colorscheme onedark
colorscheme codedark

let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeStatusline = ''
let g:NERDTreeWinPos = "left"
let NERDTreeIgnore = ['node_modules$', 'coverage$', 'dist$', '.git$']
" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'
" Enables eslint for javascript
let g:ale_fixers = { 'javascript': ['eslint'] , 'typescript':['eslint'] }

" NerdCommenter settings
" Create default mappings
let g:NERDCreateDefaultMappings = 1
let g:NERDSpaceDelims = 1  			" Add spaces after comment delimiters by default
let g:NERDCompactSexyComs = 1			" Use compact syntax for prettified multi-line comments
let g:NERDDefaultAlign = 'left'			" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDCommentEmptyLines = 1			" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDTrimTrailingWhitespace = 1		" Enable trimming of trailing whitespace when uncommenting

" NERDCommenter config ends here
let $FZF_DEFAULT_COMMAND = 'ag -g ""'         " This repo is used for skipping files in gitignore

" Golang specific configuration for vim-go plugin using (experimental settings) golang gopls
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'
let g:ale_linters = {'go': ['gopls'] } 			"  sends go lint output to ale
let g:go_fmt_command = "goimports"    			" Run goimports along gofmt on each save
let g:go_auto_type_info = 1           			" Automatically get signature/type info for object under cursor

let g:airline#extensions#tabline#enabled = 1
let g:airline_theme = 'codedark'
" let g:prettier#autoformat_config_present = 1		" Autoformat files if prettier config file is found
let g:prettier#autoformat_config_files = ['prettier.config.js']
let g:prettier#exec_cmd_async = 1			" Runs prettier async
let g:prettier#exec_cmd_path="~/.nvm/versions/node/v12.18.3/bin/prettier"
let g:prettier#config#config_precedence = 'prefer-file'
" turn terminal to normal mode with escape
tnoremap <Esc> <C-\><C-n>
" start terminal in insert mode
au BufEnter * if &buftype == 'terminal' | :startinsert | endif
" open terminal on ctrl+n
function! OpenTerminal()
  split term://bash
  resize 10
endfunction
nnoremap <c-n> :call OpenTerminal()<CR>

" Add all the options for filetype plugin here
autocmd   FileType go source ~/.config/nvim/autoload/go.vim
autocmd   FileType typescript source ~/.config/nvim/autoload/typescript.vim
autocmd   FileType javascript source ~/.config/nvim/autoload/typescript.vim
" File type options end up here

" Add shortcuts below
map <C-/> gcc
" nnoremap <silent> <C-b> :NERDTreeToggle<CR>
nnoremap <C-p> :FZF<CR>
" Easier split navigation Ref: https://thoughtbot.com/blog/vim-splits-move-faster-and-more-naturally
" Ref from https://github.com/preservim/nerdtree/wiki/F.A.Q.
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Resetting Leader key to space
" let mapleader = " " 					" map leader to Space
" let mapleader = "," 					" maps comma as leader

" Insert all Leader key options here
map <leader>h :noh<CR>
" map <leader>t :GoTest<CR> " Run Golang tests with vim-go
map <leader>R :source ~/.config/nvim/init.vim<CR> " Refresh neovim config
" map <leader>/ gcc<CR> " comment lines
" map <leader>/ NERDCommenterToggle " Toggle Inline comment


" All leader short cuts end above
