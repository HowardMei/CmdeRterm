# Copyright (C) 2001, 2002  Earnie Boyd  <earnie@users.sf.net>
# This file is part of the Minimal SYStem.
#   http://www.mingw.org/msys.shtml
#
#         File:	profile
#  Description:	Shell environment initialization script
# Last Revised:	2002.05.04

# normalize CMDER_ROOT to unix path
CMDER_ROOT="$(cd "$CMDER_ROOT"; pwd)"

if [ -z "$MSYSTEM" ]; then
  MSYSTEM=MINGW32
fi

# My decision to add a . to the PATH and as the first item in the path list
# is to mimick the Win32 method of finding executables.
#
# I filter the PATH value setting in order to get ready for self hosting the
# MSYS runtime and wanting different paths searched first for files.
if [ $MSYSTEM == MINGW32 ]; then
  export PATH=".:/usr/local/bin:/mingw/bin:/bin:$PATH"
else
  export PATH=".:/usr/local/bin:/bin:/mingw/bin:$PATH"
fi

# strip out cygwin paths from PATH
case "$PATH" in
*/cygwin/*)
	export PATH=$(p=$(echo $PATH | tr ":" "\n" | grep -v "/cygwin/" | tr "\n" ":"); echo ${p%:})
	;;
esac

if [ -z "$USERNAME" ]; then
  LOGNAME="`id -un`"
else
  LOGNAME="$USERNAME"
fi

# Set up USER's home directory
if [ -z "$HOME" -o ! -d "$HOME" ]; then
  HOME="$CMDER_ROOT/home"
  if [ -z "$HOME" -o ! -d "$HOME" ]; then
    HOME="$USERPROFILE"
  fi
fi

if [ ! -d "$HOME" ]; then
	printf "\n\033[31mERROR: HOME directory '$HOME' doesn't exist!\033[m\n\n"
	echo "This is an error which might be related to msysGit issue 108."
	echo "You might want to set the environment variable HOME explicitly."
	printf "\nFalling back to \033[31m/ ($(cd / && pwd -W))\033[m.\n\n"
	HOME=/
fi

export PATH="$HOME/bin:$CMDER_ROOT/bin:$PATH"

export GNUPGHOME=$HOME/.gnupg

if [ -z "$MAGIC" ]; then
  magicfile=$(cd / && pwd -W)'/mingw/share/misc/magic.mgc'
  test -f "$magicfile" && export MAGIC="$magicfile"
fi

if [ "x$HISTFILE" == "x/.bash_history" ]; then
  HISTFILE=$HOME/.bash_history
fi

if [ -e $HOME/.inputrc ]; then
    export INPUTRC=$HOME/.inputrc
else
    export INPUTRC=/etc/inputrc
fi

case "$LS_COLORS" in
*rs*)
	# Our ls may ot handle LS_COLORS inherited in a Wine process
	unset LS_COLORS;;
esac

export HOME LOGNAME MSYSTEM HISTFILE

for i in /etc/profile.d/*.sh ; do
  if [ -f $i ]; then
    . $i
  fi
done

export MAKE_MODE=unix

# let's make sure that the post-checkout hook is installed
test -d /.git && test ! -x /.git/hooks/post-checkout &&
test -x /share/msysGit/post-checkout-hook &&
mkdir -p /.git/hooks &&
cp /share/msysGit/post-checkout-hook /.git/hooks/post-checkout

. /etc/git-completion.bash
[ -r /etc/git-prompt.sh ] && . /etc/git-prompt.sh

# non-printable characters must be enclosed inside \[ and \]
PS1='\[\033]0;$MSYSTEM:${PWD//[^[:ascii:]]/?}\007\]' # set window title
PS1="$PS1"'\[\033[32m\]'       # change color
PS1="$PS1"'\u@\h '             # user@host<space>
PS1="$PS1"'\[\033[33m\]'       # change color
PS1="$PS1"'\w'                 # current working directory
if test -z "$WINELOADERNOEXEC"
then
    PS1="$PS1"'$(__git_ps1)'   # bash function
fi
PS1="$PS1"'\[\033[0m\]'        # change color
PS1="$PS1"'\n'                 # new line
PS1="$PS1"'λ'                 # prompt: always λ

# set default options for 'less'
export LESS=-FRSX
export LESSCHARSET=utf-8

# set default protocol for 'plink'
export PLINK_PROTOCOL=ssh

# read user-specific settings, possibly overriding anything above
if [ -e $HOME/.bashrc ]; then
    . $HOME/.bashrc
elif [ -e $HOME/.bash_profile ]; then
    . $HOME/.bash_profile
elif [ -e /etc/bash_profile ]; then
    . /etc/bash_profile
fi
