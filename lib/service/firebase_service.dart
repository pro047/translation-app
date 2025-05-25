import 'package:firebase_database/firebase_database.dart';

class FirebaseService {
  static final _db = FirebaseDatabase.instance.ref();

  static Future<void> pushTranslatedSentence(String sentence) async {
    await _db.child('translatedText').push().set(sentence);
  }

  static Future<void> clearDatabase() async {
    final ref = FirebaseDatabase.instance.ref('translatedText');
    try {
      await ref.remove();
      print('db 초기화 ');
    } catch (err) {
      print('db 초기화 실패 $err');
    }
  }
}
