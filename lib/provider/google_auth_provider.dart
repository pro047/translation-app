import 'package:flutter/services.dart' show rootBundle;
import 'package:googleapis_auth/auth_io.dart';
import 'package:http/http.dart';

class GoogleAuthProvider {
  final String assetPath;

  GoogleAuthProvider(this.assetPath);

  Future<AccessCredentials> getAccessCredentials() async {
    final serviceAccountJson = await rootBundle.loadString(assetPath);

    final accountCredentials = ServiceAccountCredentials.fromJson(
      serviceAccountJson,
    );

    final scopes = ['https://www.googleapis.com/auth/cloud-platform'];

    final client = Client();

    try {
      return obtainAccessCredentialsViaServiceAccount(
        accountCredentials,
        scopes,
        client,
      );
    } finally {
      client.close();
    }
  }
}
