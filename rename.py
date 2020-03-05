#!/usr/bin/env python
# coding=utf-8
'''
:Author: Gallon
:Date: 2020-01-18 18:07:15
:LastEditTime: 2020-01-18 19:50:37
:FilePath: /undefined/Users/h.jl/scripts/rename.py
'''
import os
import argparse


def rename(filepath: str):
    if os.path.exists(filepath):
        file = filepath.split('/')[-1]
        if file.startswith('Screen Shot'):
            basePath = '/'.join(filepath.split('/')[:-1])
            oldname = os.path.join(basePath, file)
            newname = os.path.join(basePath, file.replace(' ', '-'))
            print(newname, oldname)
            os.rename(oldname, newname)

if __name__ == '__main__':
    parser = argparse.ArgumentParser(description="replace space by dash in given filename")
    parser.add_argument("filepath", help="filepath you want to rename")
    args = parser.parse_args()
    filepath = args.filepath
    rename(filepath)