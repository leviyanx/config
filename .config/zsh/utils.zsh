# Create a folder and go into it
#   $ mcd test
mcd() {
    mkdir -p "$1"
    cd "$1"
}
# To test my zsh load time
timezsh() {
  shell=${1-$SHELL}
  for i in $(seq 1 10); do /usr/bin/time $shell -i -c exit; done
}
# Save current working directory
marco() {
    export marco_dir=`pwd`
}
# Return back the directory where you executed marco
polo() {
    cd $marco_dir
}
