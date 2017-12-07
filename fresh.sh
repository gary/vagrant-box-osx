#!/bin/sh

osxbox_vmname=`VBoxManage list vms | grep osx | awk '{print $1}' | tr -d '"'`

vagrant halt
VBoxManage snapshot "$osxbox_vmname" restore Fresh
vagrant reload
vagrant up
vagrant ssh -c 'ln -s /src/etc/{bootstrap,test}.sh .'

vagrant ssh
