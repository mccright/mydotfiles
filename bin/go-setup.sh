#!/bin/bash
# Thank you Tom Hudson
# https://github.com/tomnomnom/dotfiles/blob/master/go-setup.sh
# and https://go.dev/doc/install
# VERSION="1.18"
# VERSION="1.20.4"
# VERSION="1.24.6"
VERSION="1.26.1"

source .bashrc
# download the specified golang version
wget https://go.dev/dl/go$VERSION.linux-amd64.tar.gz
# extract the archive you just downloaded
tar xvfz go$VERSION.linux-amd64.tar.gz
# Do not untar the archive into an existing /usr/local/go tree. 
# This is known to produce broken Go installations.
# remove previous Go installation by deleting the /usr/local/go folder (if it exists)
sudo rm -rf /usr/local/go
# Move the newly-extracted files creating a fresh Go tree in /usr/local/go
sudo mv go /usr/local/
# Get latest tools and packages for development & static analysis
go install golang.org/x/tools/cmd/goimports@latest
# Get the latest autocompletion daemon for the Go programming language
go install github.com/nsf/gocode@latest
# Cleanup by deleting the just-downloaded golang archive
rm go$VERSION.linux-amd64.tar.gz
