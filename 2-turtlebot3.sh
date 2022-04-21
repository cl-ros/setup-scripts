#!/usr/bin/env bash
set -eu

mkdir -p ~/turtlebot3_ws/src
cd ~/turtlebot3_ws
cat << EOF > turtlebot3.repos
repositories:
  turtlebot3/turtlebot3:
    type: git
    url: https://github.com/ROBOTIS-GIT/turtlebot3.git
    version: foxy-devel
  turtlebot3/turtlebot3_msgs:
    type: git
    url: https://github.com/ROBOTIS-GIT/turtlebot3_msgs.git
    version: foxy-devel
  turtlebot3/turtlebot3_simulations:
    type: git
    url: https://github.com/ROBOTIS-GIT/turtlebot3_simulations.git
    version: foxy-devel
  utils/DynamixelSDK:
    type: git
    url: https://github.com/ROBOTIS-GIT/DynamixelSDK.git
    version: foxy-devel
  utils/hls_lfcd_lds_driver:
    type: git
    url: https://github.com/ROBOTIS-GIT/hls_lfcd_lds_driver.git
    version: foxy-devel
EOF
vcs import src < turtlebot3.repos

colcon build --symlink-install
echo 'source ~/turtlebot3_ws/install/setup.bash' >> ~/.bashrc

echo 'export GAZEBO_MODEL_PATH=$GAZEBO_MODEL_PATH:~/turtlebot3_ws/src/turtlebot3/turtlebot3_simulations/turtlebot3_gazebo/models' >> ~/.bashrc
echo 'export TURTLEBOT3_MODEL=burger' >> ~/.bashrc
source ~/.bashrc

echo "success installing turtlebot3"
echo "Run 'source ~/.bashrc'"