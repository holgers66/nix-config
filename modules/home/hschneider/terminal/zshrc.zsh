# Interactive shell config, moved from the hand-written ~/.config/zsh/.zshrc on 2026-11-03.
# Appended to the home-manager generated .zshrc via programs.zsh.initContent.
# (The Powerlevel10k instant-prompt block lives in default.nix so it runs first.)

# Oh My Zsh (installed manually in $ZDOTDIR/ohmyzsh)
export ZSH="$ZDOTDIR/ohmyzsh"
export TERM=xterm-256color
ZSH_THEME="powerlevel10k/powerlevel10k"
plugins=(git)
source $ZSH/oh-my-zsh.sh

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh

alias kubectl="kubecolor"
alias k="kubecolor"
alias ip="ip --color=auto"
alias rebuild="sudo nix run nix-darwin --extra-experimental-features nix-command --extra-experimental-features flakes -- switch --flake .#Holgers-MacBook-Pro"
alias tf="terraform"
alias tfaa="terraform apply --auto-approve"
alias tfda="terraform destroy --auto-approve"
alias tfi="terraform init"
alias tfp="terraform plan"
alias rm="echo Use 'trash', or the full path i.e. '/bin/rm'"

export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

# Rancher Desktop CLI tools (moved from ~/.zshrc, which zsh never reads because ZDOTDIR=~/.config/zsh)
export PATH="$HOME/.rd/bin:$PATH"

# Go-installed tools (subfinder, subzy)
export PATH="$HOME/go/bin:$PATH"
[ -f ~/fubectl/fubectl.source ] && source ~/fubectl/fubectl.source

# bun completions
[ -s "/Users/hschneider/.bun/_bun" ] && source "/Users/hschneider/.bun/_bun"
