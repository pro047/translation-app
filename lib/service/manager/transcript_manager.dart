import 'package:trans_app/data/dto/transcript_data.dart';
import 'package:trans_app/service/queue/trans_queue.dart';

class TranscriptManager {
  String? _lastTranscript;

  bool shouldTranslate(String transcript, bool isFinal) {
    return isFinal || transcript.length > 5;
  }

  bool isDuplicate(String transcript) {
    return transcript == _lastTranscript;
  }

  void markTranslated(String transcript) {
    _lastTranscript = transcript;
  }

  void addToTransQueue(TranscriptData data, TransQueue queue) {
    if (!isDuplicate(data.transcript) &&
        shouldTranslate(data.transcript, data.isFinal)) {
      queue.add(data);
      markTranslated(data.transcript);
    }
  }
}
