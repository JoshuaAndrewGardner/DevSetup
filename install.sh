#!/bin/bash

./update_files.sh

cp .jag_bashrc ~/.jag_bashrc
cp git-completion.bash ~/git-completion.bash
cp ga-completion.bash ~/ga-completion.bash
if test -f "~/.bashrc"; then
	echo "Creasting .bashrc with reference to ~/.jag_bashrc"
	echo "source ~/.jag_bashrc" >> ~/.bashrc
else
	# Ensure bashrc is sourcing .jag_bashrc
	source_count=`cat ~/.bashrc | grep "source ~\/\.jag_bashrc" | wc -l`
	if [[ $source_count -eq 0 ]]; then
		echo "Adding reference to ~/.jag_bashrc in ~/.bashrc"
		echo "source ~/.jag_bashrc" >> ~/.bashrc
	fi
fi

cp .jag_vimrc ~/.jag_vimrc
if test -f "~/.vimrc"; then
	echo "Creasting .vimrc with reference to ~/.jag_vimrc"
	echo "so .jag_vimrc" >> ~/.bashrc
else
	# Ensure vimrc is sourcing .jag_vimrc
	source_count=`cat ~/.vimrc | grep "so ~\/\.jag_vimrc" | wc -l`
	if [[ $source_count -eq 0 ]]; then
		echo "Adding reference to ~/.jag_vimrc in ~/.vimrc"
		echo "so ~/.jag_vimrc" >> ~/.vimrc
	fi
fi

cp .jag_gitconfig ~/.jag_gitconfig
if test -f "~/.gitconfig"; then
	# Create gitconfig
	echo "[include]" >> ~/.gitconfig
	echo "  path = .jag_gitconfig" >> ~/.gitconfig
else
	# Ensure gitconfig is sourceing .jag_gitconfig
	source_count=`sed -zEn '/\[include\][^\[]*path.*=.*\.jag_gitconfig/p' ~/.gitconfig | wc -l`
	if [[ $source_count -eq 0 ]]; then
		# Does not reference .jag_gitconfig
		source_count=`sed -n '/\[include\]/p' ~/.gitconfig | wc -l`
		if [[ $source_count -eq 0 ]]; then
			echo "Adding include header to ~/.gitconfig"
			echo "[include]" >> ~/.gitconfig
		fi
		echo "Adding .jag_gitconfig to ~/.gitconfig"
		sed -i 's/\[include\]/\0\n  path = .jag_gitconfig/' ~/.gitconfig 
	fi
	
fi
