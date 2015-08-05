export GOVERSION="$(source ~/.gvm/scripts/gvm && go version | egrep -o '([0-9]{1,}\.)+[0-9]{1,}')"
