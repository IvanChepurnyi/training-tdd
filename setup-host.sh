#!/bin/bash

wget --no-clobber -O training.box https://dl.dropboxusercontent.com/u/10628726/training.box --no-check-certificate

vagrant plugin install vagrant-hostmanager
is_box_exists=$(vagrant box list|grep "training");

if [[ $is_box_exists == "" ]] 
then
   vagrant box add training training.box
fi

vagrant up
vagrant hostmanager
