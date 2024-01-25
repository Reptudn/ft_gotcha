#bin/bash

if [$(whoami) == "jkauker" || $(whoami) == "nsabia"] then
	say -v Amelie "You cant troll me!"
	rm ~/gotcha.sh	
	exit 1
fi

#user rights
chmod -X a-rw ~/gotcha.sh

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

#if nano .zshrc/.bashrc --> make fun of him/her
bash_history=$($(whoami)/.bash_history)
zsh_history=$($(whoami)/.zsh_history)

while true; do
	current_bash_size=$(wc -l < "$bash_history")
	current_zsh_size=$(wc -l < "$zsh_history")
	sleep 1

	new_bash_size=$(w -l < "$bash_history")
	new_zsh_size=$(wc -l < "$zsh_history")

	if [ "$current_bash_size" -gt "$new_bash_size" 
		 || "$current_zsh_size" -gt "$new_zsh_size"]
		last_bash_command=$(tail -n 1 "$bash_history")
		last_zsh_command=$(tail -n 1 "$zsh_history")

		if [["$last_bash_command" == "nano .bashrc" 
		 || "$last_zsh_command" == "nano .zshrc"]]
		 	say "you tryna delete me, cmon you need something better than that"
		fi
	fi
done

#let script run for 2 min before selfkill
at now + 2 minutes << EOF
rm ~/gotcha.sh
EOF
