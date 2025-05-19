import 'package:firebase_database/firebase_database.dart';

class FirebaseService {
  static Future<void> uploadTranslatedText(String text) async {
    final ref = FirebaseDatabase.instance.ref('translatedText/text');
    print('업로드 시작 : $text');
    await ref.set(text);
    print('업로드 완료');
  }
}
