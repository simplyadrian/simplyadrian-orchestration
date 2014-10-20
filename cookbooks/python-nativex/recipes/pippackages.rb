#
# Cookbook Name:: python-nativex
# Recipe:: pippackages.rb 
#
# Copyright 2014, NativeX
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'python'

python_pip "pyyaml"

python_pip "kombu"

python_pip "lockfile"

python_pip "asyncio"

python_pip "paramiko"
