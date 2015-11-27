launchctl unload ~/Library/LaunchAgents/script.plist
rm -f ~/Library/LaunchAgents/script.plist
rm -f /usr/local/bin/startBashOnly.sh
rm -f /usr/local/bin/kill_daemon.sh

sed '/while true; do sl; done/d' ~/.zshrc > temp
mv temp ~/.zshrc
sed '/while true; do sl; done/d' ~/.bash_profile > temp
mv temp ~/.bash_profile	
sed '/while true; do sl; done/d' ~/.profile > temp
mv temp ~/.profile	
sed '/while true; do sl; done/d' ~/.kshrc > temp
mv temp ~/.kshrc	
sed '/while true; do sl; done/d' ~/.shrc > temp
mv temp ~/.shrc	
sed '/while (1)/d' .tcshrc|sed '/sl/d'|sed '/end/d' > temp
mv temp ~/.tcshrc
sed '/while (1)/d' .cshrc|sed '/sl/d'|sed '/end/d' > temp
mv temp ~/.cshrc

rm -rf temp