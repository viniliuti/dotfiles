#! /bin/bash
konsolecolors=$1

dbuskonsole=$(qdbus6 | grep konsole)

if [ "x$dbuskonsole" = x ]; then
	sed -i s/DefaultProfile=.*/DefaultProfile=$konsolecolors.profile/ ~/.config/konsolerc
else
	for bus in $dbuskonsole; do
		for win in $(qdbus6 $bus | grep /Windows/); do
			qdbus6 $bus $win org.kde.konsole.Window.setDefaultProfile $konsolecolors
			break
		done
		for ses in $(qdbus6 $bus | grep /Sessions/); do
			qdbus6 $bus $ses org.kde.konsole.Session.setProfile $konsolecolors
		done
	done
fi
