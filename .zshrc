if [ "$TMUX" = "" ]; then tmux; fi

export DISABLE_FZF_KEY_BINDINGS="false"
export FZF_DEFAULT_OPTS='--color=fg:#f8f8f2,bg:#282a36,hl:#bd93f9 --color=fg+:#f8f8f2,bg+:#44475a,hl+:#bd93f9 --color=info:#ffb86c,prompt:#50fa7b,pointer:#ff79c6 --color=marker:#ff79c6,spinner:#ffb86c,header:#6272a4'
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="dracula"

plugins=(
        fzf
        fzf-tab
        git
        zsh-autosuggestions
        zsh-completions
        zsh-syntax-highlighting
        zsh-vi-mode
    )

source $ZSH/oh-my-zsh.sh

export TERM=screen-256color
export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:$HOME/Library/Python/3.9/bin"
export EDITOR=nvim
export VISUAL=nvim
export TZ='Europe/Athens'
export WSL_DISTRO_NAME="Ubuntu"
export BAT_THEME="Dracula"

setopt HIST_IGNORE_ALL_DUPS
unsetopt beep

if [[ $(command -v nvim) ]];
then
    alias v="nvim"
    alias vi="nvim"
    alias vim="nvim"
fi

if [[ $(command -v tail) ]];
then
    alias s="tail -r  ~/snippets.txt | fzf --border --layout=reverse --prompt='Search for a command to copy into the clipboard: ' | clipcopy"
fi

if [[ $(command -v tac) ]];
then
    alias s="tac  ~/snippets.txt | fzf --border --layout=reverse --prompt='Search for a command to copy into the clipboard: ' | clipcopy"
fi

alias e="vim ~/snippets.txt"
alias k="kubectl"
alias h="helm"

alias cat="bat"
alias ls="ls -altrh --color=auto"
alias tf="terraform"
alias tg="terragrunt"

alias assume="source /usr/local/bin/assume"

eval "$(starship init zsh)"
[[ $commands[kubectl] ]] && source <(kubectl completion zsh)

export KEYTIMEOUT=1

autoload -U +X bashcompinit && bashcompinit
autoload -Uz compinit && compinit

complete -o nospace -C /usr/bin/terraform terraform
complete -o nospace -C /usr/bin/terragrunt terragrunt
complete -C '$HOME/.local/bin/aws_completer' aws

if [[ -e /etc/bash_completion.d/azure-cli ]];
then
    source /etc/bash_completion.d/azure-cli
fi

source <(helm completion zsh)
source ~/set-tmux-title.sh

zstyle -e ':completion:*:hosts' hosts 'reply=(
  ${=${${${${(@M)${(f)"$(cat ~/.ssh/config 2>/dev/null)"}:#Host *}#Host }:#*\**}:#*\?*}}
)'

zstyle ':completion:*:ssh:argument-1:*' tag-order hosts

zvm_after_init_commands+=('[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh && enable-fzf-tab')

