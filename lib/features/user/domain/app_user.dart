import 'package:cloud_firestore/cloud_firestore.dart';

/// Enum que define los roles disponibles
enum UserRole {
  admin('admin'),
  visitor('visitor');

  final String value;
  const UserRole(this.value);

  /// Convierte string a UserRole
  static UserRole fromString(String role) {
    return UserRole.values.firstWhere(
      (r) => r.value == role,
      orElse: () => UserRole.visitor, // Por defecto es visitor
    );
  }
}

/// Modelo de usuario con rol
class AppUser {
  final String uid;
  final String email;
  final UserRole role;
  final String? displayName;
  final String? photoUrl;
  final DateTime createdAt;

  AppUser({
    required this.uid,
    required this.email,
    required this.role,
    this.displayName,
    this.photoUrl,
    required this.createdAt,
  });

  /// Convierte desde Firestore
  factory AppUser.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return AppUser(
      uid: doc.id,
      email: data['email'] ?? '',
      role: UserRole.fromString(data['role'] ?? 'visitor'),
      displayName: data['displayName'],
      photoUrl: data['photoUrl'],
      createdAt: (data['createdAt'] as Timestamp?)?.toDate() ?? DateTime.now(),
    );
  }

  /// Convierte a Firestore
  Map<String, dynamic> toFirestore() {
    return {
      'email': email,
      'role': role.value,
      'displayName': displayName,
      'photoUrl': photoUrl,
      'createdAt': Timestamp.fromDate(createdAt),
    };
  }

  /// Verifica si es admin
  bool get isAdmin => role == UserRole.admin;

  /// Verifica si es visitor
  bool get isVisitor => role == UserRole.visitor;

  /// Copia con modificaciones
  AppUser copyWith({
    String? uid,
    String? email,
    UserRole? role,
    String? displayName,
    String? photoUrl,
    DateTime? createdAt,
  }) {
    return AppUser(
      uid: uid ?? this.uid,
      email: email ?? this.email,
      role: role ?? this.role,
      displayName: displayName ?? this.displayName,
      photoUrl: photoUrl ?? this.photoUrl,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  String toString() {
    return 'AppUser(uid: $uid, email: $email, role: ${role.value}, displayName: $displayName)';
  }
}
