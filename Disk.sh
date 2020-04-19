#!/bin/bash
# Author: Tiktakje
# Automatically Format/Partition a disk

if [ "$EUID" -ne 0 ]
  then echo "Please run as superuser"
  exit
fi

echo ------------------------------------------------------------------------------------------
fdisk -l
echo ------------------------------------------------------------------------------------------
echo 
echo Which disk? /dev/...

read disk

echo
echo Format, 1 or New Partition, 2: 

read use

if [ $use -eq 1 ]
then
    (
        echo d
        echo 1
        echo d
        echo 2
        echo d
        echo 3
        echo d
        echo 4                
        echo w
    ) | sudo fdisk /dev/$disk
        clear
        echo Done

elif [ $use -eq 2 ]
then
    (
        echo n
        echo
        echo
        echo
        echo
        echo w
        echo q
    ) | sudo fdisk /dev/$disk
        clear
        echo Done

else
    echo
    echo
    echo Please run again
fi
