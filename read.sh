#!/bin/bash

echo "what is your username"
read -s NAME

echo "Print name: $NAME"

echo "Please enter your password:"
read -p "3 attempts left" password

echo "print pawd:$password"

echo "please enter again:"
read -s -p "2 attempts left" passwd
echo "print pwd: $passwd"