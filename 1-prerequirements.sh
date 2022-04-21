#!/usr/bin/env bash
set -eu

sudo apt-get update
sudo apt-get install -y gazebo11 ros-foxy-gazebo-ros-pkgs
sudo apt-get install -y ros-foxy-cartographer ros-foxy-cartographer-ros ros-foxy-navigation2 ros-foxy-nav2-bringup
sudo apt-get install -y python3-vcstool

echo "success installing prerequirements"