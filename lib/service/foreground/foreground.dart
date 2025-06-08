import 'package:flutter_foreground_task/flutter_foreground_task.dart';

@pragma('vm:entry-point')
void startCallback() {
  FlutterForegroundTask.setTaskHandler(MyTaskHandler());
}

void startForegroundService() {
  FlutterForegroundTask.startService(
    notificationTitle: '실시간 번역 중',
    notificationText: '음성을 인식하고 있어요',
    callback: startCallback,
  );
}

class MyTaskHandler extends TaskHandler {
  @override
  Future<void> onStart(DateTime timestamp, TaskStarter starter) async {
    print('Onstart(starter: ${starter.name})');
  }

  @override
  void onRepeatEvent(DateTime timestamp) {
    final data = {'timestampMillis': timestamp.millisecondsSinceEpoch};
    FlutterForegroundTask.sendDataToMain(data);
  }

  @override
  Future<void> onDestroy(DateTime timestamp, bool isTimeout) async {
    print('onDestroy(isTimeout: $isTimeout)');
  }

  @override
  void onNotificationPressed() {
    FlutterForegroundTask.launchApp();
  }
}
