#!/bin/bash
set -e

source /opt/ros/humble/setup.bash
source /root/ros2_ws/install/setup.bash

echo "Starting system_metrics_node..."
ros2 run mypkg system_metrics_node &
NODE_PID=$!

sleep 2

echo "Checking topic existence..."
ros2 topic list | grep /system_metrics

echo "Checking topic publish..."
timeout 3 ros2 topic echo /system_metrics | head -n 1

echo "Test passed."

kill $NODE_PID
wait $NODE_PID 2>/dev/null || true

