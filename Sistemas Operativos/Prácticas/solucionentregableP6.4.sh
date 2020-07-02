#!/bin/bash
who | cut -d ' ' -f 1
echo "Type the user"
read var1
finger "$var1" | grep "Name" | cut -d ':' -f 3 