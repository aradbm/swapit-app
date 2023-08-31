class User {
  final String uid;
  final String userName;
  final DateTime? lastLogin;
  final DateTime dateCreated;
  final String userStatus;

  User(
    this.uid,
    this.userName,
    this.lastLogin,
    this.dateCreated,
    this.userStatus,
  );

  User.fromMap(Map<String, dynamic> map)
      : uid = map['uid'],
        userName = map['userName'],
        lastLogin = map['lastLogin'],
        dateCreated = map['dateCreated'],
        userStatus = map['userStatus'];

  Map<String, dynamic> toMap() {
    return {
      'userid': uid,
      'username': userName,
      'lastlogin': lastLogin,
      'datecreated': dateCreated,
      'userstatus': userStatus,
    };
  }

  factory User.fromJson(Map<String, dynamic> json) {
    // convert the date strings to DateTime objects
    return User(
      json['userid'].toString(),
      json['username'],
      DateTime.parse(json['lastlogin']),
      DateTime.parse(json['datecreated']),
      json['userstatus'],
    );
  }

  @override
  String toString() {
    return 'User{uid: $uid, userName: $userName, lastLogin: $lastLogin, dateCreated: $dateCreated, userStatus: $userStatus}';
  }
}
