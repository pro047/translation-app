import 'package:trans_app/data/dto/transcript_data.dart';
import 'package:trans_app/interfaces/abstract_queue.dart';

class TransQueue extends AbstractQueue<TranscriptData> {
  @override
  void add(TranscriptData data) {
    super.add(data);
    print('add on transQueue');
  }
}
