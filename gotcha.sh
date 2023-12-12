#bin/bash

if [$(whoami) == "jkauker" || $(whoami) == "nsabia"] then
	say -v Amelie "You cant troll me!"
	exit 1
fi

#user rights
chmod a-rw ~/gotcha.sh

#Volume
volume_loop_flag=true
set_volume_loop() {
    while [ "$volume_loop_flag" = true ]; do
        osascript -e "set Volume 10"
        sleep 1  # Adjust sleep time as needed
    done
}

if [ "$1" != "test" ]; then
    set_volume_loop &
	volume_loop_pid=$!
else
    osascript -e "set Volume 0"
fi

#text
lyrics=(
	"Initialize the countdown for systemreset",
	"5",
	"4",
	"3",
	"2",
	"1",
)

iterate_lyrics(){
	for line in "${lyrics[@]}"; do
		say "$line"
		sleep 0.5
	done
	#process id von browser etc...
	say "nah joking man you just forgot to lock your screen"
	kill "$volume_loop_pid"
}

if ("$1" != "yourmum"); then
	iterate_lyrics &
fi

#let script run for 20 min before selfkill
at now + 20 minutes << EOF
rm ~/gotcha.sh
EOF
