#!/bin/bash

sudo apt update

#packages is already installed?
num=0
rub=$(dpkg --get-selections ruby | grep install)
bun=$(dpkg --get-selections ruby-bundler | grep install)

if [[ "$rub" == *"install"* ]]
then 
echo "Ruby already installed"
else 
num=$(( $num + 1 ))
fi


if [[ "$bun" == *"install"* ]]
then
echo "Bundler already installed"
else
num=$(( $num + 2 ))
fi

echo "The Num is $num"

#if some packages missing - install them
case $num in
	1)
		#missing just ruby
		vari="ruby-full"
		;;
	2)
		#missing just bundler
		vari="ruby-bundler build-essential"
		;;
	3)
		#everithing is lost)
		vari="ruby-full ruby-bundler build-essential"
		;;
	*)
		#if nothing to update or something go wrong... let it be wget to update...
		vari="wget"
		;;
esac

echo "To update: $vari"

sudo apt install -y $vari

