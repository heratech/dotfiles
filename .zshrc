
source ~/.zplug/init.zsh

# Make sure to use double quotes
zplug "chrissicool/zsh-256color"
zplug "zsh-users/zaw"
zplug "djui/alias-tips"
#zplug "peterhurford/git-aliases.zsh"
zplug "plugins/common-aliases", from:oh-my-zsh
zplug "plugins/git", from:oh-my-zsh
zplug "plugins/sudo", from:oh-my-zsh
zplug "plugins/z", from:oh-my-zsh
zplug "plugins/composer", from:oh-my-zsh
zplug "plugins/npm", from:oh-my-zsh
zplug "plugins/vagrant", from:oh-my-zsh
zplug "plugins/archlinux", from:oh-my-zsh
#zplug "zsh-users/zsh-syntax-highlighting", defer:2

# Can manage local plugins
#zplug "~/.zsh", from:local

# Load theme file
#zplug 'dracula/zsh', as:theme
#zplug "mafredri/zsh-async", on:sindresorhus/pure
#zplug 'sindresorhus/pure', defer:2
zplug mafredri/zsh-async, from:github, defer:0  # Load this first
zplug sindresorhus/pure, use:pure.zsh, from:github, as:theme

zplug "zsh-users/zsh-autosuggestions", defer:2
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-history-substring-search", defer:3
zplug "zsh-users/zsh-syntax-highlighting", defer:3

# Install plugins if there are plugins that have not been installed
if ! zplug check; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
zplug load
source .zshrc.local
