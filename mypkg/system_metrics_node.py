import rclpy
from rclpy.node import Node
from std_msgs.msg import String
import psutil

class SystemMetricsNode(Node):
    def __init__(self):
        super().__init__('system_metrics_node')

        self.publisher_ = self.create_publisher(
            String,
            'system_metrics',
            10
        )

        self.timer = self.create_timer(
            1.0,   # 1 Hz
            self.timer_callback
        )

    def timer_callback(self):
        cpu = psutil.cpu_percent()
        mem = psutil.virtual_memory().percent
        disk = psutil.disk_usage('/').percent

        msg = String()
        msg.data = (
            f"cpu={cpu}%, "
            f"memory={mem}%, "
            f"disk={disk}%"
        )

        self.publisher_.publish(msg)

def main():
    rclpy.init()
    node = SystemMetricsNode()
    rclpy.spin(node)
    rclpy.shutdown()
