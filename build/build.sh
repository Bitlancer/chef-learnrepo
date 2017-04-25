#!/bin/bash

vagrant up
vagrant package --output chef-intermediate.box
vagrant box add chef-intermediate chef-intermediate.box
