#!/bin/bash

if [ "$(whoami)" == "jkauker" ] || [ "$(whoami)" == "nsabia" ]; then
    say -v Amelie "You can't troll me!"
    rm ~/gotcha.sh
    exit 1
fi

# Benutzerrechte
chmod a-rw ~/gotcha.sh

# Lautstärke
volume_loop_flag=true
set_volume_loop() {
    while [ "$volume_loop_flag" = true ]; do
        osascript -e "set Volume 10"
        sleep 1  # Anpassen der Schlafzeit bei Bedarf
    done
}

if [ "$1" != "test" ]; then
    set_volume_loop &
    volume_loop_pid=$!
else
    osascript -e "set Volume 0"
fi

# Text und PID-Kills
pid_vscode=$(pgrep -i "Code")
pid_chrome=$(pgrep -i "google-chrome")
pid_firefox=$(pgrep -i "firefox")
pid_safari=$(pgrep -i "Safari")
pid_slack=$(pgrep -i "slack")

lyrics=(
    "Initialize the countdown for system reset",
    "5",
    "4",
    "3",
    "2",
    "1",
)

iterate_lyrics() {
    for line in "${lyrics[@]}"; do
        say "$line"
        sleep 0.5
    done
    if [ -n "$pid_vscode" ]; then
        code --wait --command "workbench.action.files.saveAll"
        kill -15 "$pid_vscode"
        sleep 1
    elif [ -n "$pid_chrome" ]; then
        kill -15 "$pid_chrome"
        sleep 0.5
    elif [ -n "$pid_firefox" ]; then
        kill -15 "$pid_firefox"
        sleep 0.5
    elif [ -n "$pid_safari" ]; then
        kill -15 "$pid_safari"
        sleep 0.5
	elif [ -n "$pid_slack" ]; then
	kill -15 "$pid_slack"
	sleep 0.5
    fi
    sleep 3
    say "Nah, just joking. You forgot to lock your screen."
    kill "$volume_loop_pid"
}

if [ "$1" != "yourmum" ]; then
    iterate_lyrics &
fi

# Wenn nano .zshrc/.bashrc --> make fun of him/her
bash_history="$HOME/.bash_history"
zsh_history="$HOME/.zsh_history"
counter=0

while true; do
    current_bash_size=$(wc -l < "$bash_history")
    current_zsh_size=$(wc -l < "$zsh_history")
    sleep 1

    new_bash_size=$(wc -l < "$bash_history")
    new_zsh_size=$(wc -l < "$zsh_history")

    if [[ "$current_bash_size" -gt "$new_bash_size" ]] || [[ "$current_zsh_size" -gt "$new_zsh_size" ]]; then
        last_bash_command=$(tail -n 1 "$bash_history")
        last_zsh_command=$(tail -n 1 "$zsh_history")

        if [[ "$last_bash_command" == "nano .bashrc" || "$last_zsh_command" == "nano .zshrc" ]]; then
            say "You're trying to delete me. Come on, you need something better than that."
            ((counter++))
            if [ "$counter" -ge 5 ]; then
                break
            fi
        fi
    fi
done

# make it impossible to write something
while true; do
	read -rn1 key
	if ["$key" == "e"]; then
		echo "eeeeeeeeeeeeee"
	else if ["$key" == "E"]; then
		echo "EEEEEEEEEEEEEEE"
done


# in case of an emercency there is still a possibility to shut down the script
while true; do
	read -rn17 key
	if ["$key" == "emercency shutdown"];do
		chmod a+rw ~/gotcha.sh
		rm ~/gotcha.sh
		break;
done

# Lass das Skript 20 Minuten laufen, bevor es sich selbst löscht
at now + 20 minutes <<EOF
chmod a+rw ~/gotcha.sh
rm ~/gotcha.sh
EOF
