#!/bin/bash

./update_files.sh

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

