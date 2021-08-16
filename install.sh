#!/bin/bash

./update_files.sh

cp git-completion.bash ~/git-completion.bash
cp .jag_bashrc ~/.jag_bashrc
if test -f "~/.bashrc"; then
	# Create bachrc
	echo "source .jag_bashrc" >> ~/.bashrc
else
	# Ensure bashrc is sourcing .jag_bashrc
	source_count=`cat ~/.bashrc | grep "source \.jag_bashrc" | wc -l`
	if [[ "$source_count" -eq "0" ]]; then
		echo "source .jag_bashrc" >> ~/.bashrc
	fi
fi

cp .jag_vimrc ~/.jag_vimrc
if test -f "~/.vimrc"; then
	# Create bachrc
	echo "so .jag_vimrc" >> ~/.bashrc
else
	# Ensure bashrc is sourcing .jag_bashrc
	source_count=`cat ~/.vimrc | grep "so ~\/\.jag_vimrc" | wc -l`
	if [[ "$source_count" -eq "0" ]]; then
		echo "so .jag_vimrc" >> ~/.bashrc
	fi
fi

