#!/bin/bash

launchctl unload ~/Library/LaunchAgents/script.plist
rm -f ~/Library/LaunchAgents/script.plist
rm -f /usr/local/bin/startBashOnly.sh
rm -f /usr/local/bin/kill_daemon.sh

function delete_if_file_empty {
	file_contents=`cat $1 | tr -d '\n '`
	if [[ "$file_contents" -eq "" ]]; then
		rm -rf $1
	fi 
}

function delete_while_loop {
	file=$1
	type_of_rc_file=$2
	if [[ "$type_of_rc_file" -eq "1" ]]; then
		sed '/while true; do sl; done/d' $file > temp
		mv temp $file
	else
		sed '/while (1)/d' $file|sed '/sl/d'|sed '/end/d' > temp
		mv temp $file
	fi
		
}

delete_while_loop ~/.zshrc 1
delete_if_file_empty ~/.zshrc

delete_while_loop ~/.bash_profile 1
delete_if_file_empty ~/.bash_profile

delete_while_loop ~/.profile 1
delete_if_file_empty ~/.profile

delete_while_loop ~/.kshrc 1
delete_if_file_empty ~/.kshrc

delete_while_loop ~/.shrc 1
delete_if_file_empty ~/.shrc

delete_while_loop ~/.tcshrc 2
delete_if_file_empty ~/.tcshrc

delete_while_loop ~/.cshrc 2
delete_if_file_empty ~/.cshrc

rm -rf temp