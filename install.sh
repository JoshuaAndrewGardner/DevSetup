#!/bin/bash

./update_files.sh

cp .jag_bashrc ~/.jag_bashrc
if test -f "~/.bashrc"; then
	# Ensure bashrc is sourcing .jag_bashrc
	if [[ `cat ~/.bashrc | grep "source \.jag_bashrc" | wc -l` -eq 0 ]]; then
		echo "source .jag_bashrc" >> ~/.bashrc
	fi
else
	# Create bachrc
	echo "source .jag_bashrc" >> ~/.bashrc
fi

