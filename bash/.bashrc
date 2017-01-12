#-------------------------------
# ALIASES
#-------------------------------
source ~/.aliases

#-------------------------------
# HISTORY
#-------------------------------

#Bash History Options
export HISTCONTROL=ignoredups
#export HISTCONTROL=ignoreboth
#The above is shorthand for ignorespaces and ignoredups

HISTSIZE=1000      #Maintains history for current session
HISTFILESIZE=2000  #Maintains history for previous sessions



#-------------------------------
# COMMAND PROMPT
#-------------------------------

#Prompt Customization
#Noncolor:
#export PS1="\n\t \u@\H [\w] \$?\$(__git_ps1) \[$(tput sgr0)\] \n > "
#Color:

# Checking for git prompt availability
##############################################
GIT_PROMPT=""
git --version &>/dev/null
GIT_INSTALLED="$?"

#NOTE: When testing, the tpype check on __git_ps1 will fail 
# miserably because functions are not propagated to independent shell
# processes which are spawned. Gotta find a workaround for that. However,
# function definitions ARE propagated to subshells.

if [[ $GIT_INSTALLED -eq 0 ]] && [[ $(type -t __git_ps1) == "function" ]]; then \
    GIT_PROMPT="\$(__git_ps1)"
fi

#export PS1="\n\t \u@\h \[$(tput sgr0)\]\[\033[38;5;6m\][\w]\[$(tput sgr0)\]\[\033[38;5;15m\] \$?\[$(tput setaf 2)\]\$(__git_ps1)\[$(tput sgr0)\] \n > "
export PS1="\n\t \u@\h \[$(tput sgr0)\]\[\033[38;5;6m\][\w]\[$(tput sgr0)\]\[\033[38;5;15m\] \$?\[$(tput setaf 2)\]${GIT_PROMPT}\[$(tput sgr0)\] \n > "




#-------------------------------
# UTILITY SETTINGS
#-------------------------------
export VISUAL=vim
export EDITOR=vim
export GIT_EDITOR=vim
export IGNOREEOF=3 #Takes three iterations of ctrl-D to exit terminal


#-------------------------------
# Optional Functions
#-------------------------------

#Sourcing git prompt, found using #find / -name git-prompt.sh

source_git_prompt() {
    source /usr/share/git/git-prompt.sh;
}
