sudo launchctl unload ~/Library/LaunchAgents/script.plist
sudo rm -f ~/Library/LaunchAgents/script.plist
sudo rm -f /usr/local/bin/startBashOnly.sh
# sudo rm -f /usr/local/bin/kill_daemon.sh

 cat ~/.zshrc | tr -d "while true; do sl; done" > zsh-temp
 mv zsh-temp ~/.zshrc	
 cat ~/.bash_profile | tr -d "while true; do sl; done" >  bash-temp
 mv bash-temp ~/.bash_profile
 cat ~/.profile | tr -d "while true; do sl; done" > profile-temp
 mv profile-temp ~/.profile
 cat ~/.kshrc | tr -d "while true; do sl; done" >ksh-temp
 mv ksh-temp ~/.kshrc 
 cat ~/.shrc | tr -d "while true; do sl; done" > sh-temp
 mv sh-temp ~/.shrc
 cat ~/.tcshrc | tr -d "while (1)\n sl\n end" > tcsh-temp
 mv tcsh-temp ~/.tcshrc
 cat ~/.cshrc | tr -d "while (1)\n sl\n end" > csh-temp
 mv csh-temp ~/.cshrc