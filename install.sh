#!/bin/zsh

mkdir -p backup
ls -al home | grep '^-' | cut -c 42- | xargs -I{} cp ~/{} backup/{}.bak


ls -al home | grep '^-' | cut -c 42- | xargs -I{} cp home/{} ~/{}

source ~/.zshrc
