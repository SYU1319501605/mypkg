# ロボットシステム学課題２

## 概要

`mypkg` は、ROS 2 上で動作するシステム監視用パッケージです。
CPU使用率、メモリ使用率、ディスク使用率を取得し、
ROS 2 のトピックとして定期的に publish します。

ロボット実行中の負荷状況確認や、PCの状態監視に利用できます。

## 利用例

- ロボット動作中の CPU / メモリ負荷の監視
- 長時間実行プロセスのリソース消費状況の可視化
- 他ノードと並列実行した際のシステム負荷分析
- デバッグ時のシステム負荷ログ取得

---

## ノード

### system_metrics_node

システムのリソース使用状況を取得し、トピックとして送信するノードです。

- **publish トピック**：`/system_metrics`
- **メッセージ型**：`std_msgs/msg/String`

###送信されるメッセージ例：

`CPU: 23.4 %, Memory: 45.1 %, Disk: 62.0 %`

- **CPU**：システム全体のCPU使用率 [%] 
- **Memory**：使用中メモリ量 / 総メモリ量 [%] 
- **Disk**：ルートディスク(`/`)の使用率 [%] 
- **Publish周期**：1秒ごと

この情報により、ロボットやPCの負荷状況をリアルタイムで監視できます。

---

## トピック一覧

| トピック名 | 型 | 説明 |
|-----------|----|------|
| `/system_metrics` | `std_msgs/msg/String` | CPU・メモリ・ディスク使用率 |

---

## ビルド方法

```bash
$ cd ~/ros2_ws
$ colcon build --packages-select mypkg
$ source install/setup.bash

```

## 実行

実行方法
```bash
$ ros2 run mypkg system_metrics_node
```
別ターミナルで動作確認：
```bash
$ ros2 topic echo /system_metrics
```

### ローカル環境
- Ubuntu 22.04 LTS
- ROS2

---

## ライセンスおよび著作権表示 ##
- このソフトウェアパッケージは，3条項BSDライセンスの下，再頒布および使用が許可されます。
- @2025 Syu Kaki
