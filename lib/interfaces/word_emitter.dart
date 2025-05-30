abstract class WordEmitter {
  void start(
    void Function(String word) onWord, {
    void Function(String status)? onStatus,
    void Function(String error)? onError,
  });
  void stop();
}
