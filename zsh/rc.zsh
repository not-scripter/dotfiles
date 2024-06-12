# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

if [ "$TERM_PROGRAM" != "Apple_Terminal" ]; then
eval "$(oh-my-posh init zsh --config ~/theme.omp.yaml)"
fi

# ZSH_THEME="theme"

#Plugins
plugins=(
  gh
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
  fzf-tab
  you-should-use
)

source $ZSH/oh-my-zsh.sh
#ZOXIDE
eval "$(zoxide init zsh)"

# Aliases
alias sz='source ~/.zshrc'
# alias ls='colorls'
alias la='ls -A'

# Multiple Neovim Config
alias nvim-test="NVIM_APPNAME=TestVim nvim"
alias nvim-astro="NVIM_APPNAME=AstroNvim nvim"
alias nvim-lazy="NVIM_APPNAME=LazyVim nvim"
alias nvim-chad="NVIM_APPNAME=NvChad nvim"

function nvims() {
  items=("default" "TestVim" "AstroNvim" "LazyVim" "NvChad")
  config=$(printf "%s\n" "${items[@]}" | fzf --prompt=" Neovim Config  " --height=~50% --layout=reverse --border --exit-0)
  if [[ -z $config ]]; then
    echo "Nothing selected"
    return 0
  elif [[ $config == "default" ]]; then
    config=""
  fi
  NVIM_APPNAME=$config nvim $@
}

bindkey -s ^a "nvims\n"
