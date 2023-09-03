class AppUser {
  final String uid;
  final String username;
  final DateTime? lastlogin;
  final DateTime datecreated;
  final String userstatus;

  AppUser({
    required this.uid,
    required this.username,
    required this.lastlogin,
    required this.datecreated,
    required this.userstatus,
  });

  AppUser.fromMap(Map<String, dynamic> map)
      : uid = map['uid'],
        username = map['username'],
        lastlogin = map['lastlogin'],
        datecreated = map['datecreated'],
        userstatus = map['userstatus'];

  Map<String, dynamic> toMap() {
    return {
      'userid': uid,
      'username': username,
      'lastlogin': lastlogin,
      'datecreated': datecreated,
      'userstatus': userstatus,
    };
  }

  factory AppUser.fromJson(Map<String, dynamic> json) {
    // convert the date strings to DateTime objects
    return AppUser(
      uid: json['uid'],
      username: json['username'] ?? '',
      lastlogin: DateTime.parse(json['lastlogin'] ?? '2021-01-01'),
      datecreated: DateTime.parse(json['datecreated']),
      userstatus: json['userstatus'] ?? 'active',
    );
  }

  @override
  String toString() {
    return 'User{uid: $uid, userName: $username, lastLogin: $lastlogin, dateCreated: $datecreated, userStatus: $userstatus}';
  }
}
