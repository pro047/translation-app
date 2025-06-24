class TranscriptData {
  final String transcript;
  final bool isFinal;

  TranscriptData({required this.transcript, required this.isFinal});

  factory TranscriptData.fromJson(Map<String, dynamic> json) {
    return TranscriptData(
      transcript: json['transcript'] ?? '',
      isFinal: json['isFinal'] ?? false,
    );
  }
}
