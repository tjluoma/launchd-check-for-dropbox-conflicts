
[Dropbox](https://www.dropbox.com/home) is a great tool but conflicted copies are seemingly inevitable.

Rather than try to remember to look for them (which I never remember to do) I have launchd look for them every 5 minutes, and if it finds any, it tells me.

If the shell script is run via launchd, it reports its findings via [Growl](http://growl.info) using  [growlnotify](http://growl.info/extras.php/).

If the shell script is run on the command line, it simply reports the number of conflicts to stdout.

Note: when run via launchd, it does not report when zero conflicts are found, because that would be an annoying distraction. If run via the command line, it will report 0 conflicts mostly to tell you that it has finish running.

The Growl notifications are 'sticky' but only one will appear at a time on the screen, so if you leave this running overnight you won't come back to 50 notices that a conflicted copy was found.

# Installation

1.  Move **dropbox-launchd-conflicted-copy.sh** to /usr/local/bin/ and make sure it's executable.

(You can actually install it anywhere, just make sure to edit the plist to point to the correct path.)

2. Move **com.tjluoma.check-for-dropbox-conflicted-copies.plist** to ~/Library/LaunchAgents/ and then either run

`launchctl load ~/Library/LaunchAgents/com.tjluoma.check-for-dropbox-conflicted-copies.plist`

or log out and back in.



