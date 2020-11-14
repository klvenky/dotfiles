##vim-shortcuts
-----
This list has a list of commands that I have learned over time in vim. Since it's not the primary editor for me as of now, I assume maintaining a list would be very helpful.

You might hear all of these a lot when you hear about vim
- Vim is a keyboard language
- you spend most of your time in normal mode
- vim learning takes time.

These all are true and we just need a plan to how to use vim. That alone would be sufficient to master vim.

All the commands that are listed below are the ones which are to be run in normal/command mode i.e., when you see `--NORMAL--` at the left bottom corner of your vim editor.

First things first, the first and foremost important thing to learn about vim is ["How to quit vim"](https://stackoverflow.com/questions/11828270/how-do-i-exit-the-vim-editor). This is one of the most popular questions ever on stackoverflow. So that's basically `Esc :q`

### Basic Navigation:

h - move left
j - move down
k - move up
l - move right

0 OR ^(shift + 6)  - Start of line
$ - End of line

### Word navigation

w - go to starting of next word
e - end of current word
b - starting of previous word


f - goto first instance of character in line
t - go to the literal before first instance of character

Ex: consider the text "Hello World! I am going to be a vim master" and cursor is at first 'l' in hello
1) now the command `fa` would move us to first instance of `a`
2) now the command `ta` would move the cursor to character before the next occurance of character 'a'

* _Tip_

All the navigation commands can be preceeded with numbers to move by that measure. i.e., if we type 10w when the cursor is at the beginning of line then we move to the starting of the 11<sup>th</sup> word.

### Cut, Copy & Paste

Cut, copy & paste are essentials of any programmers life. So it's better if we understand that.
x - cuts the current character/selection
y - copies the current character/selection
p - pastes the text that's cut/copied last. Beware, it's not your OS clipboard. It's just vim's last copied/cut text.

### Selecting multiple characters to cut/copy

If you have noticed in the previous section, the selection part is how we can select more than one character to cut/copy.
v - select text using the navigation shortcuts

### Combining commands

