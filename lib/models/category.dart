class ItemCategory {
  final String name;
  final int categoryid;
  final int parentid;

  ItemCategory({
    required this.name,
    required this.categoryid,
    required this.parentid,
  });

  factory ItemCategory.fromJson(Map<String, dynamic> json) {
    return ItemCategory(
      name: json['categoryname'],
      categoryid: json['categoryid'],
      parentid: json['parentcategory'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'categoryname': name,
      'categoryid': categoryid,
      'parentcategory': parentid,
    };
  }
}
