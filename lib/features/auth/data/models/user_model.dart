class UserModel {
  final String id;
  final String name;
  final String phone;
  final String email;
  final String sessionId;
  final String profilePath;

  UserModel({
    required this.id,
    required this.name,
    required this.phone,
    required this.email,
    required this.sessionId,
    required this.profilePath,
  });

  factory UserModel.fromSupabaseMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id']?.toString() ?? '',
      name: map['name'] ?? '',
      phone: map['phone'] ?? '',
      email: map['email'] ?? '',
      sessionId: map['firebase_uid'] ?? '',
      profilePath: map['avatar_url'] ?? '',
    );
  }

  Map<String, dynamic> toSupabaseMap() {
    return {
      'firebase_uid': sessionId,
      'name': name,
      'phone': phone,
      'email': email,
      'avatar_url': profilePath,
    };
  }
}
