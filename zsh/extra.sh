#ENCODING
export LC_ALL=C.UTF-8

# TMUXIFIER
export PATH="$HOME/.tmuxifier/bin:$PATH"
eval "$(tmuxifier init -)"

# ZOXIDE
eval "$(zoxide init zsh)"

# ALIASES
alias lg="lazygit"

# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
