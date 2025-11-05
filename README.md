# My Personal Linux Setup
A place where i ll be keeping my configs. Just a personal setup, feel free to try it,


# Vim
I use **Neovim** with the AstroNvim distro,
all my changes to the AstroNvim defaults live in **./nvim/lua/polish.lua** and **./nvim/lua/me/\***

install it with **./install-nvim-config** wich will essentially copy ./nvim to ~/.config/nvim

AstroNvim works best with it's dependencies, but only Neovim v0.10+ is required.
[Download nvim-0.11.4](https://github.com/neovim/neovim/releases/download/stable/nvim-linux-x86_64.appimage). 
See [AstroNvim](https://docs.astronvim.com/) for details.

# i3
./i3 is my i3 config, to use: copy it to your i3 config path, something like: **~/.config/i3**  

The only required dependency is **i3 and X11**.  
Some other dependencies:
```
alacritty firefox jq i3lock-fancy rofi libnotify dunst
```

## In case u did really try it:
here is the essentials, refer to the config itself for full details

$mod is the meta(win) key  

$mod+Return to open alacritty (a terminal)
$mod+b to open firefox
$mod+d to open rofi (an app luncher)

$mod+q to close focused window

$mod+<hjkl> or arrows to move focus
$mod+Ctrl+<hjkl> or arrows to move between workspaces
$mod+Ctrl+Shift+<hjkl> or arrows to move windows between workspaces
$mod+Alt+<hjkl> or arrows to move windows inside the same workspace

$mod+shift+v to select vertical split mode on window
$mod+v to select horizontal split mode on window

$mod+Alt+r restart i3
$mod+Alt+e exit i3

$mod+Alt+l lock screen

$mod+Alt+d shutdown
$mod+Alt+Delete restart

$mod+m+<azeiop> to mark a windows
$mod+<azeiop> to go to marked window
