#!/bin/bash.exe

[ -z ${BASHPROFILELOADED} ] && export BASHPROFILELOADED="yes"

if [ -e "${HOME}/.path_profile" ]; then
    #echo "Loading ${HOME}/.path_profile ... ..."
    . ${HOME}/.path_profile
fi

# Always enable colored ls and grep output
export CLICOLOR="1"
export PS1="\[\033[33m\][\u@\H:\[\033[32m\]\w\[\033[33m\]]$\[\033[0m\]"
export LS_COLORS='no=00:fi=00:di=01;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.ogg=01;35:*.mp3=01;35:*.wav=01;35:'


# Enable aliases to be sudoed
alias mkdir='mkdir -p'
# Mv all current files and folders one dir up and omit the parent dir
alias mvup='find . -mindepth 1 -maxdepth 1 -exec mv -t.. -- {} +'
alias what='type -a'
alias unsetall='unset all;set +o nounset'
alias cls='clear;set +o nounset'
alias clr='reset;clear;set +o nounset'
# List all files colorized in long format
alias ll="ls -lph --color"
alias lt='ll -t'
# List all files colorized in long format, including dot files
alias la="ls -lpha --color"
alias ld='__lsdir() { local p="$1"; ls --almost-all -lhd $(realpath ${p:-$(pwd)})/*/ 2>/dev/null; unset -f __lsdir; }; __lsdir'
alias lf='__lsf() { local p="$1"; ls --almost-all -lha $(realpath ${p:-$(pwd)}) 2>/dev/null | grep -v ^d | grep -v ^l; unset -f __lsf; }; __lsf'
alias lh='__lshidden() { local p="$1"; ls --almost-all -d $(realpath ${p:-$(pwd)})/.??* 2>/dev/null; unset -f __lshidden; }; __lshidden'
alias lhf='__lsfhidden() { local p="$1"; ls --almost-all -lha $(realpath ${p:-$(pwd)})/.??* 2>/dev/null | grep -v ^d; unset -f __lsfhidden; }; __lsfhidden'
alias lhd='__lsdirhidden() { local p="$1"; ls --almost-all -lhd $(realpath ${p:-$(pwd)})/.??*/ 2>/dev/null; unset -f __lsdirhidden; }; __lsdirhidden'
alias ls="ls --color"
alias lu='du -ach --max-depth=1'
alias reload=". ${HOME}/.bash_profile"
alias wget='wget -c'
alias path='echo -e ${PATH//:/\\n}'
alias psa='__pslsa() { local p="$1"; ps -f -l -p -u -s -W | head -n ${p:=101}; unset -f __pslsa; }; __pslsa'
alias psp='__pslsp() { local p="$@"; local ptot="$(ps -f -l -p -u -s -W)";local phead="$(echo "$ptot" | head -1)";local pbody="$(echo "$ptot" | sed '1d' | grep -i ${p:-""} | grep -v grep)";echo "$phead";echo "$pbody";unset -f __pslsp; }; __pslsp'
alias vex='__vex() { [ $# -eq 1 ] && [ "$1" == "-q" ] && [ -r "bin/activate" ] && deactivate && return 0;[ -r "${!#}/bin/activate" ] && cd "${!#}" && . bin/activate || virtualenv "$@";[ -d "${!#}" ] && cd "${!#}";[ -r "bin/activate" ] && . bin/activate; unset -f __vex; }; __vex'


# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# Beautify the bash prompt
if [ -e "${HOME}/.bash_prompt" ]; then 
    #echo "Loading ${HOME}/.bash_prompt ... ..."
    . ${HOME}/.bash_prompt
elif [ -e "/etc/.bash_prompt" ]; then 
    #echo "Loading /etc/.bash_prompt ... ..."
    . /etc/.bash_prompt
fi

# If possible, add tab completion for many more commands
if [ -e "${HOME}/.bash_completion" ]; then 
    #echo "Loading ${HOME}/.bash_completion ... ..."
    . ${HOME}/.bash_completion
elif [ -e "/etc/.bash_completion" ]; then 
    #echo "Loading /etc/.bash_completion ... ..."
    . /etc/.bash_completion
fi
