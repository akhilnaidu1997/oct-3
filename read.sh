#!/bin/bash

echo "what is your username"
read -s NAME

echo "Print name: $NAME"

echo "Please enter your password:"
read -p "3 attempts left" password

echo "print pawd:$password"

echo "please enter again:"
read -s -p "two attempts left" passwd
echo "print pwd: $passwd"

echo "Enter code received"
read -n "only three letters chould be entered" code
echo "Code received: $code"

echo "Enter corrcet code"
read -t -n "only 3 letter:" codu
echo "print codu: $codu"