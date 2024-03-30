#ENCODING
#export LC_ALL=C.UTF-8

# TMUXIFIER
export PATH="$HOME/.tmuxifier/bin:$PATH"
eval "$(tmuxifier init -)"

# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# ALIASES
alias lg="lazygit"
alias tm="tmuxifier s main"
alias ta="tmux attach"
