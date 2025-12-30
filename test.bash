#!/bin/bash
# system_metrics node basic test

set -e

echo "Starting system_metrics node..."
ros2 run mypkg system_metrics &
NODE_PID=$!

# ノード起動待ち
sleep 2

echo "Checking topic existence..."
ros2 topic list | grep /system_metrics

echo "Checking topic publish..."
timeout 3 ros2 topic echo /system_metrics | head -n 1

echo "Test passed."

# ノード停止
kill $NODE_PID
wait $NODE_PID 2>/dev/null || true

