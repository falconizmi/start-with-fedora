# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
    for rc in ~/.bashrc.d/*; do
        if [ -f "$rc" ]; then
            . "$rc"
        fi
    done
fi
unset rc

#####################################################
################### Izmi settings ###################
#####################################################

git_branch() {
     if git status &> /dev/null ; then
         echo -e ':\e[0;35m'$(git branch --show-current)'\e[m'
    fi

    # echo ":" $(git branch --show-curemt 2> /dev/null)
}

# show currently stopped jobs next to the command prompt
cur_jobs () {
    if [ ! -z "$(jobs)" ] ; then
        echo -n ' ('

        # 1. print all currently paused jobs
        # 2. get names of the paused jobs and add a space at the end
        # 3. replace newlines with commas
        # 4. ignore last two chars - a joining comma and a space
        jobs -s \
            | sed "s/.*Stopped *\(.*\)/\1 /"  \
            | tr  '\n' ',' \
            | head -c -2

        echo -n ')'
    fi
}

PROMPT_COMMAND=__prompt_command    # Function to generate PS1 after CMDs

__prompt_command() {
    local EXIT="$?"                # This needs to be first
    PS1=""

    local RCol='\[\e[0m\]'	# Exit color-change mode

    # Colors
    local Red='\[\e[0;31m\]'
    local Gre='\[\e[0;32m\]'
    local LightGreen='\[\e[1;92m\]'

    # Virtual Env
    if [[ -n "$VIRTUAL_ENV" ]]; then
        # Strip out the path
	local RemovePrefix="${VIRTUAL_ENV##*/}"
	#  Leave the env name
	local RemoveSufix="${RemovePrefix%-*}"
	local Venv="(${LightGreen}venv${RCol}:${RemoveSufix}) "
    else
        # In case you don't have one activated
        local Venv=''
    fi
    PS1+="${Venv}"

    # Exit Code
    if [ $EXIT != 0 ]; then
        PS1+="[${Red}$EXIT${RCol}] "        # Add red if exit code non 0
    else
        PS1+="[${Gre}$EXIT${RCol}] "
    fi



    #PS1+="[\t ${LightGreen}Izmi-home${RCol} \w]\n${LightGreen}$> ${RCol}"
    PS1+="[\t] [\w]${LightGreen}$ ${RCol}\n${LightGreen}Izmi-home${RCol} ${LightGreen}> ${RCol}"
}

# Folder colors
export LS_COLORS='di=1;94'

#History time
export HISTTIMEFORMAT="%F %T "

#History size managament:
## Set the  maximum  number of lines contained in the history file ##
export HISTFILESIZE=5000000

## Set the number of commands to remember in the command history ##
export HISTSIZE=10000

## Append it ##
shopt -s histappend

######
# Controlling how commands are saved on the history file ##
# ignoreboth means:                       ##
# a) Command which begin with a space character are not saved in the history list               ##
# b) Command matching the previous history entry  to  not  be  saved (avoid duplicate commands) ##
# 
# ignoredups means:
# part b) from ignoreboth
# 
# ignorespace means:
# part a) from ignoreboth
######
export HISTCONTROL=ignoredups


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Your Aliases
alias izmi_sem='cd ~/izmi/school/6-semestr/'

# Project Aliases
alias class-tasker='cd ~/git/my-projects/class-tasker/'

