#bin/bash

if [$(whoami) == "jkauker" || $(whoami) == "nsabia"] then
	say -v Amelie "You cant troll me!"
	rm ~/gotcha.sh	
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

#text and pidkills
pid_vscode=$(pgrep -i "Code")
pid_chrome=$(pgrep -i "google-chrome")
pid_firefox=$(pgrep -i "firefox")
pid_safari=$(pgrep -i "Safari")

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
	if [-n "$pid_vscode"]; then
		code --wait --command "workbench.action.files.saveAll"
		kill -15 "$pid_vscode"
		sleep 1;
	elif [-n "$pid_chrome"]; then
		kill -15 "$pid_chrome"
		sleep 0.5;
	elif [-n "$pid_firefox"]; then
		kill -15 "$pid_firefox"
		sleep 0.5;
	elif [-n "$pid_safari"]; then
		kill -15 "$pid_safari"
		sleep 0.5;
	fi
	sleep 3;
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
