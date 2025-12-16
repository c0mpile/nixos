#================================================================
# Aliases File
# Path: $HOME/.zsh/custom/aliases.zsh
#================================================================

#================================================================
# Editor aliases
#================================================================
alias v='nvim' vi='nvim'
alias se='sudo -e'

#================================================================
# File listing aliases
#================================================================
alias tree='tree -a -I .git'

#================================================================
# Common tool replacements
#================================================================
alias cat='bat'
alias grep='grep --color=auto'
alias diff='diff --color=auto'
alias ip='ip --color=auto'
alias md='mkdir -pv'
alias df='df -h'
alias du='du -h'
alias free='free -h'
alias cp='cp -f'
alias mv='mv -f'
alias rsync='rsync -a --info=progress2'

#================================================================
# Improved command shortcuts
#================================================================
alias fu='fuck'
alias path='echo -e ${PATH//:/\\n}'
alias now='date +"%T"'
alias netstat='ss -tulpn'
alias ports='netstat -tulanp'
alias wget='wget -c'
alias ping='ping -c 5'
alias psg='ps aux | grep -v grep | grep -i -e VSZ -e'
alias psmem='ps auxf | sort -nr -k 4'
alias pscpu='ps auxf | sort -nr -k 3'
alias h='history'
alias j='jobs -l'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias fastping='ping -c 100 -s.2'

#================================================================
# Directory navigation
#================================================================
alias rd='rmdir'
alias smd='mkdir -p'
alias srd='sudo rmdir'

#================================================================
# Build tool shortcuts
#================================================================
alias make="make -j`nproc`"
alias ninja="ninja -j`nproc`"

#================================================================
# System maintenance
#================================================================
alias c='clear'
alias tb='nc termbin.com 9999'
alias systemctl-failed='systemctl --failed'        # List failed services
alias jctl='journalctl -p 3 -xb'                   # Get the error messages from journalctl

#================================================================
# Other quality of life aliases
#================================================================
alias please='sudo $(fc -ln -1)'                  # Repeat last command with sudo
alias dmesg='sudo dmesg -H'                       # Human-readable kernel messages
alias suspend='systemctl suspend'                 # Suspend computer
alias reboot='systemctl reboot'                   # Reboot computer
alias poweroff='systemctl poweroff'               # Power off computer
alias mem='free -h | grep Mem'                    # Show memory usage in human-readable format

#================================================================
# Flatpak
#================================================================
alias fpi='flatpak install'
alias fpu='flatpak uninstall'
alias fpup='flatpak update'
alias fps='flatpak search'
alias fpr='flatpak run'
alias fpls='flatpak list'
alias fpsh='flatpak run --command=bash'
alias fp-cache='flatpak list --columns=application | xargs -I %s -- flatpak run --command=fc-cache %s -f -v'

#================================================================
# Sudo
#================================================================
alias sudo='sudo '  # Preserve sudo functionality while allowing alias expansion

#================================================================
# nas functions 
#================================================================

alias sbu='sb update'
alias sbi='sb install'
alias sbl='sb list'
alias inventory='sudo nvim /srv/git/saltbox/inventories/host_vars/localhost.yml'
