import 'dart:async';
import 'dart:collection';

import 'package:trans_app/data/dto/transcript_data.dart';

abstract class AbstractQueue<TrnascriptData> {
  final Queue<TranscriptData> _queue = ListQueue<TranscriptData>();
  final StreamController<void> _onAddController = StreamController.broadcast();

  Queue<TranscriptData> get queue => _queue;
  int get length => _queue.length;
  bool get isEmpty => _queue.isEmpty;
  bool get isNotEmpty => _queue.isNotEmpty;

  Stream<void> get onAdd => _onAddController.stream;

  void add(TranscriptData data) {
    _queue.add(data);
    _onAddController.add(null);
  }

  TranscriptData remove() => _queue.removeFirst();

  void clear() => _queue.clear();
}
