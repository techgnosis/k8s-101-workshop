#!/bin/sh

#expects that you have targeted the correct uaa already
set -e

password_length=12


for i in {1..25} 
do
    
    username="kuber${i}"
    echo "generating password"
    password=$(pwgen $password_length 1)
    echo "creating user \"${username}\""
    uaac user add $username --emails $username@localhost.com -p $password
    echo "adding user to read group"
    uaac member add pks.clusters.admin.read $username

    echo "$username:$password" >> logins.txt

done