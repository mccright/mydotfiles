#!/bin/bash
# Thank you Tom Hudson
# https://github.com/tomnomnom/dotfiles/blob/master/go-setup.sh
VERSION="1.18"

source .bashrc
wget https://storage.googleapis.com/golang/go$VERSION.linux-amd64.tar.gz
tar xvfz go$VERSION.linux-amd64.tar.gz
sudo rm -rf /usr/local/go
sudo mv go /usr/local/

go install golang.org/x/tools/cmd/goimports@latest
go install github.com/nsf/gocode@latest

rm go$VERSION.linux-amd64.tar.gz
