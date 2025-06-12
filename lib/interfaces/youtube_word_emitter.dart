abstract class YoutubeWordEmitter {
  void start(
    void Function(String word) onWord, {
    void Function(String status)? onStatus,
    void Function(String error)? onError,
    required String websocketUrl,
  });
  void stop();
}
