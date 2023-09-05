class SwapCard {
  final int cardId;
  final String uidH1;
  final String uidH2;
  final String? uidH3; // Nullable, because it's optional in your table
  final int bpItem1;
  final int bpItem2;
  final int? bpItem3; // Nullable, because it's optional in your table
  final bool? user1Interested; // Nullable, because it's optional in your table
  final bool? user2Interested; // Nullable, because it's optional in your table
  final bool? user3Interested; // Nullable, because it's optional in your table
  final DateTime swapDate;

  SwapCard({
    required this.cardId,
    required this.uidH1,
    required this.uidH2,
    this.uidH3,
    required this.bpItem1,
    required this.bpItem2,
    this.bpItem3,
    this.user1Interested,
    this.user2Interested,
    this.user3Interested,
    required this.swapDate,
  });

  // getters
  int get getCardId => cardId;
  String get getUidH1 => uidH1;
  String get getUidH2 => uidH2;
  String? get getUidH3 => uidH3;
  int get getBpItem1 => bpItem1;
  int get getBpItem2 => bpItem2;
  int? get getBpItem3 => bpItem3;
  bool? get getUser1Interested => user1Interested;
  bool? get getUser2Interested => user2Interested;
  bool? get getUser3Interested => user3Interested;
  DateTime get getSwapDate => swapDate;

  // setters
  set setCardId(int cardId) => cardId = cardId;
  set setUidH1(String uidH1) => uidH1 = uidH1;
  set setUidH2(String uidH2) => uidH2 = uidH2;
  set setUidH3(String? uidH3) => uidH3 = uidH3;
  set setBpItem1(int bpItem1) => bpItem1 = bpItem1;
  set setBpItem2(int bpItem2) => bpItem2 = bpItem2;
  set setBpItem3(int? bpItem3) => bpItem3 = bpItem3;
  set setUser1Interested(bool? user1Interested) =>
      user1Interested = user1Interested;
  set setUser2Interested(bool? user2Interested) =>
      user2Interested = user2Interested;
  set setUser3Interested(bool? user3Interested) =>
      user3Interested = user3Interested;
  set setSwapDate(DateTime swapDate) => swapDate = swapDate;

  // Create a SwapCard from JSON (if you're fetching it from an API)
  factory SwapCard.fromJson(Map<String, dynamic> json) {
    return SwapCard(
      cardId: json['cardid'],
      uidH1: json['uid_h1'],
      uidH2: json['uid_h2'],
      uidH3: json['uid_h3'],
      bpItem1: json['bp_item1'],
      bpItem2: json['bp_item2'],
      bpItem3: json['bp_item3'],
      user1Interested: json['user1interested'],
      user2Interested: json['user2interested'],
      user3Interested: json['user3interested'],
      swapDate: DateTime.parse(json['swapdate']),
    );
  }

  // Convert the SwapCard to a Map (if you're saving it back to an API or local database)
  Map<String, dynamic> toJson() {
    return {
      'cardid': cardId,
      'uid_h1': uidH1,
      'uid_h2': uidH2,
      'uid_h3': uidH3,
      'bp_item1': bpItem1,
      'bp_item2': bpItem2,
      'bp_item3': bpItem3,
      'user1interested': user1Interested,
      'user2interested': user2Interested,
      'user3interested': user3Interested,
      'swapdate': swapDate.toIso8601String(),
    };
  }
}
