# fzf
# key bindings for command-line
# 1) find file or directory (using fd with fzf)
export FZF_DEFAULT_COMMAND="fd" # vim also use fd with fzf

export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_T_OPTS="--height=50% --layout=reverse --inline-info --border "
# toggling between data sources
FZF_CTRL_T_OPTS+="--prompt 'All> ' "
FZF_CTRL_T_OPTS+="--header 'CTRL-D: Directories / CTRL-F: Files' "
FZF_CTRL_T_OPTS+="--bind 'ctrl-d:change-prompt(Directories> )+reload(fd --type directory --hidden --no-ignore)' "
FZF_CTRL_T_OPTS+="--bind 'ctrl-f:change-prompt(Files> )+reload(rg --files --no-ignore --hidden)' "
# enable preview
FZF_CTRL_T_OPTS+="--preview 'bat --color=always --style=numbers,changes --line-range :300 {}'"

# 2) history using fzf
export FZF_CTRL_R_OPTS="--height=50% --layout=reverse --inline-info --border "
FZF_CTRL_R_OPTS+="--preview 'echo {}' --preview-window down:3:hidden:wrap --bind '?:toggle-preview'"

# 3) fzf completion
# Use \ as the trigger sequence instead of the default **
export FZF_COMPLETION_TRIGGER='\'
# Options to fzf command
export FZF_COMPLETION_OPTS='--height=50% --border --info=inline'
# Use fd (https://github.com/sharkdp/fd) instead of the default find
# command for listing path candidates.
# - The first argument to the function ($1) is the base path to start traversal
# - See the source code (completion.{bash,zsh}) for the details.
_fzf_compgen_path() {
  fd --hidden --follow --exclude ".git" . "$1"
}
# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --type d --hidden --follow --exclude ".git" . "$1"
}
