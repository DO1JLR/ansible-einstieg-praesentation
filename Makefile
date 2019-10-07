#!/bin/bash
all: server

.ONESHELL:
install:
	git submodule update --init --recursive
	if hash apt-get 2>/dev/null; then
	  sudo apt-get update -qq >/dev/null && sudo apt-get install -qq python3 tmux
	elif hash pacman 2>/dev/null; then
	  sudo pacman -Syu python tmux --noconfirm
	elif hash dnf 2>/dev/null; then
	  sudo dnf install -y python3 tmux
	else 
	  echo -e "Please install python3 and tmux"
	fi	

server:
	if hash tmux 2>/dev/null; then
	  tmux new-session -d "python3 -m http.server 8000"
	elif hash screen 2>/dev/null; then
	  screen -dm "python3 -m http.server 8000"
	else 
	  python3 -m http.server & >/dev/null
	fi	
	if hash firefox 2>/dev/null; then
	  firefox --private-window --safe-mode http://localhost:8000/ 
	elif hash chrome 2>/dev/null; then
	  chrome --kiosk http://localhost:8000/
	elif hash chromium 2>/dev/null; then
	  chromium --kiosk http://localhost:8000/
	else 
	  echo -e "Praesentation is available at 'http://localhost:8000/'"
	fi	
