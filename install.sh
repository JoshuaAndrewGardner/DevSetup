#!/bin/bash
original_name=$0

curl -L https://github.com/JoshuaAndrewGardner/DevSetup/archive/refs/heads/master.zip -o master.zip
unzip master.zip

cd DevSetup-master
cp * ../*

