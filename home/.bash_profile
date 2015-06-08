#!/bin/bash.exe
export PATH=$CMDER_ROOT/bin:$CMDER_ROOT/vendor/msysgit/cmd:$CMDER_ROOT/vendor/msysgit/bin
export HOME="$CMDER_ROOT/home"

# Always enable colored ls and grep output
export CLICOLOR="1"
export LS_COLORS='no=00:fi=00:di=01;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.ogg=01;35:*.mp3=01;35:*.wav=01;35:'


# Enable aliases to be sudo’ed
alias mkdir='mkdir -p'
# Mv all current files and folders one dir up and omit the parent dir
alias mvup='find . -mindepth 1 -maxdepth 1 -exec mv -t.. -- {} +'
alias what='type -a'
alias unsetall='unset all;set +o nounset'
alias cls='clear;set +o nounset'
alias clr='reset;clear;set +o nounset'
# List all files colorized in long format
alias ll="ls -lph --color --group-directories-first"
alias lt='ll -t'
# List all files colorized in long format, including dot files
alias la="ls -lpha --color --group-directories-first"
alias ld='__lsdir() { local p="$1";ls --almost-all -lhd $(realpath ${p:-$(pwd)})/*/ 2>/dev/null; unset -f __lsdir; }; __lsdir'
alias lf='__lsf() { local p="$1";ls --almost-all -lha $(realpath ${p:-$(pwd)}) 2>/dev/null | grep -v ^d | grep -v ^l; unset -f __lsf; }; __lsf'
alias lh='__lshidden() { local p="$1";ls --almost-all -d $(realpath ${p:-$(pwd)})/.??* 2>/dev/null; unset -f __lshidden; }; __lshidden'
alias lhf='__lsfhidden() { local p="$1";ls --almost-all -lhd $(realpath ${p:-$(pwd)})/.??* 2>/dev/null | grep -v ^d; unset -f __lsfhidden; }; __lsfhidden'
alias lhd='__lsdirhidden() { local p="$1";ls --almost-all -lhd $(realpath ${p:-$(pwd)})/.??*/ 2>/dev/null; unset -f __lsdirhidden; }; __lsdirhidden'
alias ls="$CMDER_ROOT/bin/ls.exe --color"
alias lu='$CMDER_ROOT/bin/du.exe -ach --time --max-depth=1'
alias reload=". $HOME/.bash_profile"
alias wget='wget -c'
alias path='echo -e ${PATH//:/\\n}'
## get top process eating memory
alias memtop='__memls() { local p="$1"; ps -e -o pid,uname,comm,cmd,pmem,pcpu --sort=-pmem,-pcpu | head -n ${p:=11}; unset -f __memls; }; __memls'
## get top process eating cpu ##
alias cputop='__cpuls() { local p="$1"; ps -e -o pid,uname,comm,cmd,pcpu,pmem --sort=-pcpu,-pmem | head -n ${p:=11}; unset -f __cpuls; }; __cpuls'
alias pstop='__psls() { local p="$1"; watch -n 0.1 "ps -e -o pid,uname,comm,cmd,pcpu,pmem --sort=-pcpu,-pmem | head -n ${p:=11}"; unset -f __psls; }; __psls'
alias psa='__pslsa() { local p="$1"; ps -e -o pid,uname,comm,pcpu,pmem,etime,cmd --sort=-pcpu,-pmem | head -n ${p:=101}; unset -f __pslsa; }; __pslsa'
alias psp='__pslsp() { local p="$@"; local ptot="$(ps -e -o pid,uname,comm,pcpu,pmem,etime,cmd --sort=-pcpu,-pmem)";local phead="$(echo "$ptot" | head -1)";local pbody="$(echo "$ptot" | sed '1d' | grep -i ${p:-""} | grep -v grep)";echo "$phead";echo "$pbody";unset -f __pslsp; }; __pslsp'
alias vex='__vex() { [ $# -eq 1 ] && [ "$1" == "-q" ] && [ -r "bin/activate" ] && deactivate && return 0;[ -r "${!#}/bin/activate" ] && cd "${!#}" && . bin/activate || virtualenv "$@";[ -d "${!#}" ] && cd "${!#}";[ -r "bin/activate" ] && . bin/activate; unset -f __vex; }; __vex'

[ -f "$HOME/.win_path" ] && . "$HOME/.win_path"