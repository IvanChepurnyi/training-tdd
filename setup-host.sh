#!/bin/bash

vagrant plugin install vagrant-hostmanager
vagrant box add training training.box
vagrant up
vagrant hostmanager
