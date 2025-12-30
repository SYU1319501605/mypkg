#!/bin/bash
set -e

cd ~/ros2_ws

# ① build
colcon build --packages-select mypkg

# ② 環境読み込み
source install/local_setup.bash

# ③ 実行
echo "Starting system_metrics_node..."
ros2 run mypkg system_metrics_node &
NODE_PID=$!

sleep 2

echo "Checking topic existence..."
ros2 topic list | grep /system_metrics

kill $NODE_PID

