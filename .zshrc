# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# .bashrc, .zshrc or whatever shell you use
# export PATH=$PATH:$HOME/.local/bin

# Path to your oh-my-zsh installation.
export ZSH="/home/tux/.oh-my-zsh"
export LC_ALL="es_ES.UTF-8"
export LC_CTYPE="es_ES.UTF-8"
export LANG=en_ES.UTF-8
export XDG_RUNTIME_DIR="/run/user/$UID"
export DBUS_SESSION_BUS_ADDRESS="unix:path=${XDG_RUNTIME_DIR}/bus"
#export BAT_CONFIG_PATH="/path/to/bat.conf"


export VISUAL=nvim

#ZSH_THEME="spaceship"
#ZSH_THEME="fwalch"
#ZSH_THEME="jonathan"
ZSH_THEME="powerlevel10k/powerlevel10k"


typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet
typeset -g POWERLEVEL9K_INSTANT_PROMPT=off

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"
# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

## Uncomment the following line if pasting URLs and other text is messed up.
## DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# Caution: this setting can cause issues with multiline prompts (zsh 5.7.1 and newer seem to work)
# See https://github.com/ohmyzsh/ohmyzsh/issues/5765
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.

plugins=( git
    fzf
    common-aliases
    colored-man-pages
    zsh-syntax-highlighting
    zsh-autosuggestions
    sudo
    man
    battery
    alias-finder
    vi-mode
    zsh-completions
    zsh-fzf-history-search
    fzf-tab
)

source $ZSH/oh-my-zsh.sh

VI_MODE_RESET_PROMPT_ON_MODE_CHANGE=true
MODE_INDICATOR="%F{#458588}%f"

#PROMPT=' $(battery_pct_prompt) %M %{$fg_bold[green]%} %{$fg[cyan]%}%c %{$fg_bold[blue]%}$(git_prompt_info)
#$ '
#PROMPT='%{$fg_bold[red]%}[ %{$reset_color%}$(battery_pct_prompt)%{$fg_bold[red]%} ]-%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[red]%}@%{$fg[green]%}%M %{$fg_bold[cyan]%}%c%{$fg[red]%}]%{$reset_color%}%{$fg_bold[blue]%}$(git_prompt_info) '

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
#if [[ -n $SSH_CONNECTION ]]; then
   #export EDITOR='nvim'
#else
   #export EDITOR='nvim'
#fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.

#requisito para nvm
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm


export EDITOR='/usr/bin/nvim'

# Example aliases
alias ll='lsd -lh --group-dirs=first'
alias la='lsd -a --group-dirs=first'
alias l='lsd --group-dirs=first'
alias lla='lsd -lha --group-dirs=first'
alias ls='lsd  --group-dirs=first'
alias rr='ranger'
alias ytv='youtube-dl -f 'bestvideo+bestaudio' --recode-video mp4'
alias ytm='youtube-dl -f bestaudio --extract-audio --audio-format mp3 --audio-quality 0'
alias brillo='vim /sys/class/backlight/intel_backlight/brightness'
alias cat='bat --paging=never'
alias af='alias-finder --longer'
alias yy='copydir'
alias cf='copyfile'
alias wm='xprop WM_CLASS'
alias pyServer='python -m http.server'
alias gmd='cd ~/myCode/Dotfiles/'
alias gmm='cd ~/myCode'
alias gmc='cd ~/.config/'
alias cat='batcat --paging=never'
alias vim='nvim'
alias vi='nvim'
alias cat='batcat --paging=never'
alias yy='pwd | xclip -selection clipboard'
# ============== alias tmux
alias ide='sh ~/myCode/Dotfiles/scripts/tmux/tmuxInit.sh'
alias tmc='sh ~/myCode/Dotfiles/scripts/tmux/tmux-sessions.sh'
alias coding='tmux attach -t coding'
alias ee='exit'

# ============== alias docker
alias dsall='docker stop $(docker ps -a -q)'
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


PATH="/home/tux/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/home/tux/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/tux/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/tux/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/tux/perl5"; export PERL_MM_OPT;

neofetch

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


# Load Angular CLI autocompletion.
source <(ng completion script)

#install for font and icons theme i3wm
#fonts-font-awesome
#lxappearance
#exec crtl-t lxappearance
#==================== tips
# $ fg -> para recuperar sesiom suspendida por crtl-z
