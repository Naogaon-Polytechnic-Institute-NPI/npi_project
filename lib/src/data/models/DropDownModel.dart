class EducationSession {
  final int id;
  final String session;

  EducationSession({required this.id, required this.session});

  factory EducationSession.fromJson(Map<String, dynamic> json) {
    return EducationSession(
      id: json['id'] as int,
      session: json['session'] as String,
    );
  }
}
