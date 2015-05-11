#!/bin/bash
mkdir /tmp/adobefont
rm -rf /tmp/adobefonts/*
cd /tmp/adobefont
wget -O code.zip https://github.com/adobe-fonts/source-code-pro/archive/master.zip
wget -O sans.zip https://github.com/adobe-fonts/source-sans-pro/archive/master.zip
unzip code.zip
unzip sans.zip
mkdir -p ~/.fonts

fc-cache -f -v
