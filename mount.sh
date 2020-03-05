#!/bin/bash

sudo umount /dev/disk3s1
sudo mount_ntfs -o rw,nobrowse /dev/disk3s1 $HOME/Desktop/aaa
