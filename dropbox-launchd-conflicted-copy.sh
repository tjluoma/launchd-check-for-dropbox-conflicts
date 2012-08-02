#!/bin/zsh
#
#	Author:	Timothy J. Luoma
#	Email:	luomat at gmail dot com
#	Date:	2011-03-24
#
#	Purpose: Find conflicted copies in Dropbox

NAME=`echo $0:t`

	# change this if your Dropbox is somewhere else
DIR=$HOME

	# this will look for files with the name "'s conflicted copy YYYY-MM-DD" in it
	# except this in the Trash or the .dropbox.cache folder.
	# then it will count the lines (wc) and get rid of anything except the
	# number (tr) since 'wc' inexplicably adds blank spaces before its output.
COUNT=$(find "$DIR" -path "*(*'s conflicted copy [0-9][0-9][0-9][0-9]-[0-9][0-9]-[0-9][0-9]*" -print |\
egrep -v "$DIR/.dropbox.cache|$HOME/.Trash/" | wc -l | tr -dc '[0-9]')

if [[ "$SHLVL" == "2" ]]
then
		# if Shell Level is 2 then this is being run in iTerm or Terminal.
		# SHLVL is 1 for launchd
		# so we just output the information and then exit
	echo "$NAME: Number of Dropbox 'conflicted copy' files found: $COUNT"
	exit 0

fi

# if we get here, we are in launchd

	# if no conflicted files, exit
[[ "$COUNT" == "0" ]] && exit 0

	# if one file found, report 1 found ("file" not "files")
[[ "$COUNT" == "1" ]] && growlnotify --identifier "$NAME" --sticky --appIcon "Dropbox" --message "Found 1 conflicted file" "Dropbox"

	# if more than one found, report total number of conflicted files
[[ "$COUNT" -gt "1" ]] && growlnotify --identifier "$NAME"  --sticky  --appIcon "Dropbox" --message "Found $COUNT conflicted files" "Dropbox"

exit 0

# EOF
