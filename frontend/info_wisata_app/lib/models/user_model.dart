class User {
  final int id;
  final String name;
  final String email;


  User({
    required this.id,
    required this.name,
    required this.email,
    
  });

factory User.fromJson(Map<String, dynamic> json) {
  return User(
  
    id: json['id'] as int? ?? 0,
    name: json['name'] as String? ?? 'Nama Tidak Ada',
    email: json['email'] as String? ?? 'Email Tidak Ada',
   
  );
}

  // Untuk menyimpan ke shared_preferences jika perlu
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email
    };
  }
}