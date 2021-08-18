#!/bin/bash

_ga() {
	filenames=(`git status -s | sed -ne "s/.*\ \(.*\/\)\?\(.*\)/\2/p" | grep -i "$2" | tr "\n" " "`)
	COMPREPLY=(${filenames[@]})
}

complete -F _ga ga
