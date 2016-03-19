#!/usr/bin/env bash

FILE=$1
T_FILE="$FILE.tmp"
VERSION=$2

url=$(sed -n 's/ *url "\(.*\)#{.*/\1/p' $FILE) 
sha=$(curl "${url}${VERSION}" | sha256sum | head -c 64)


sed 's/version_number = ".*"/version_number = "'${VERSION}'"/' $FILE > $T_FILE
sed 's/sha256 ".*"/sha256 "'$sha'"/' $T_FILE > $FILE
rm $T_FILE
