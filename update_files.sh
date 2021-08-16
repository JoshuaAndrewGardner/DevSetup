#!/bin/bash

curl -L https://github.com/JoshuaAndrewGardner/DevSetup/archive/refs/heads/master.zip -o master.zip
unzip master.zip

yes | cp DevSetup-master/* .

rm -rf DevSetup-master
rm master.zip