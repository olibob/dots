if status is-interactive
    # Commands to run in interactive sessions can go here
end

set fish_greeting

# Aliases
# alias ls="lsd"
alias ls="eza"
alias l="eza -1 -s time --group-directories-first"
alias ll="eza -l -s time -h --group-directories-first"
alias lt="eza --tree --level 3"

alias c="clear"

# alias l="ls -1tr"
# alias ll="ls -ltrh"
# alias lt="ls --tree"

alias k="kubectl"
alias t="terraform"
alias v="nvim"
# tmux
alias ta='tmux attach -t'
alias ts='tmux new-session -s'
alias tl='tmux list-sessions'
alias tksv='tmux kill-server'
alias tkss='tmux kill-session -t'

alias cd='z'

set -Ux XDG_CONFIG_HOME /Users/bob/.config

set -Ux EDITOR nvim

# Set the TERM variable for Fish
set -gx TERM xterm-256color

# bat theme
set -gx BAT_THEME gruvbox-dark

# FZF theme https://github.com/tinted-theming/tinted-fzf/blob/main/fish/base16-gruvbox-dark-medium.fish
set -l color00 '#282828'
set -l color01 '#3c3836'
set -l color02 '#504945'
set -l color03 '#665c54'
set -l color04 '#bdae93'
set -l color05 '#d5c4a1'
set -l color06 '#ebdbb2'
set -l color07 '#fbf1c7'
set -l color08 '#fb4934'
set -l color09 '#fe8019'
set -l color0A '#fabd2f'
set -l color0B '#b8bb26'
set -l color0C '#8ec07c'
set -l color0D '#83a598'
set -l color0E '#d3869b'
set -l color0F '#d65d0e'

set -l FZF_NON_COLOR_OPTS

for arg in (echo $FZF_DEFAULT_OPTS | tr " " "\n")
    if not string match -q -- "--color*" $arg
        set -a FZF_NON_COLOR_OPTS $arg
    end
end

set -Ux FZF_DEFAULT_OPTS "$FZF_NON_COLOR_OPTS"\
" --color=bg+:$color01,bg:$color00,spinner:$color0C,hl:$color0D"\
" --color=fg:$color04,header:$color0D,info:$color0A,pointer:$color0C"\
" --color=marker:$color0C,fg+:$color06,prompt:$color0A,hl+:$color0D"

# Load fzf.fish
#source ~/.config/fish/conf.d/fzf.fish

# Set up key bindings for fzf
#bind \cf fzf-cd-widget
#bind \cv fzf-cd-widget
#bind \cz fzf-cd-widget
#bind \cF fzf-cd-widget
#bind \cV fzf-cd-widget
#bind \cZ fzf-cd-widget

# Set up fzf options
#set -gx FZF_DEFAULT_COMMAND 'fd --type f --hidden --follow --exclude .git'
#set -gx FZF_DEFAULT_OPTS '--layout=reverse --info=inline --height=40% --border'

# set -gx PATH $PATH $HOME/.bin $HOME/.cargo/bin $HOME/.krew/bin $HOME/.cargo/env

set -gx MANPAGER "sh -c 'col -bx | nvim +Man!'"

set -gx PATH (brew --prefix python)/libexec/bin $PATH

# Yasi
function y
    set tmp (mktemp -t "yazi-cwd.XXXXXX")
    yazi $argv --cwd-file="$tmp"
    if set cwd (command cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
        builtin cd -- "$cwd"
    end
    rm -f -- "$tmp"
end

# Rust
source "$HOME/.cargo/env.fish"

zoxide init fish | source

atuin init fish | source

starship init fish | source
