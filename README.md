dotfiles
---
My Version of vim configuration. Inspired by the talk [here](https://www.youtube.com/watch?v=_NUO4JEtkDw)

Copy/symlink the vim folder to your home directory to `$HOME/.vim`
Copy/symlink the .vimrc also to `$HOME/.vimrc`


After moving to neovim, the config folders have changed.
So, now two files have to be linked for making it work.
Files to link:
1) Create symlink to the vim folder to $HOME
	- `ln -s vim .vim && mv .vim $HOME`
2) Create a Symlink to the init.vim in .config/neovim in root
	- `cd .. && ln -s dotfiles nvim && mv nvim $HOME/.config`
3) Create a Symlink for autoload folder under local/share/nvim/site
	- `cd dotfiles && ln -s autoload $HOME/.local/share/nvim/site/autoload`

Now neovim will be ready to use
