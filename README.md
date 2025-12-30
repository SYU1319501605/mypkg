# mypkg

## 概要

`mypkg` は、ROS 2 上で動作するシステム監視用パッケージです。
CPU使用率、メモリ使用率、ディスク使用率を取得し、
ROS 2 のトピックとして定期的に publish します。

ロボット実行中の負荷状況確認や、PCの状態監視に利用できます。

---

## ノード

### system_metrics_node

システムのリソース使用状況を取得し、トピックとして送信するノードです。

- **publish トピック**：`/system_metrics`
- **メッセージ型**：`std_msgs/msg/String`

送信されるメッセージ例：

---

## トピック一覧

| トピック名 | 型 | 説明 |
|-----------|----|------|
| `/system_metrics` | `std_msgs/msg/String` | CPU・メモリ・ディスク使用率 |

---

## ビルド方法

```bash
cd ~/ros2_ws
colcon build --packages-select mypkg
source install/setup.bash


## 実行・テスト環境

### ローカル環境
- Ubuntu 22.04 LTS
- Bash

### リモート環境（GitHub Actions）
- Ubuntu latest

---

## ライセンスおよび著作権表示 ##
- このソフトウェアパッケージは，3条項BSDライセンスの下，再頒布および使用が許可されます。
- @2025 Kaki Syu
