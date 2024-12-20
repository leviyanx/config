# $HOME/bin -> $HOME/.local/bin -> /usr/local/bin -> /usr/bin ...
export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Nodejs
export PATH=$PATH:/usr/local/src/nodejs/bin
# Golang
export GOPATH=$HOME/go
export PATH=$PATH:${GOPATH}/bin

# Enable 256-color
export TERM=xterm-256color
