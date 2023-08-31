class ItemCategory {
  final String name;
  final int categoryID;
  final int parentID;

  ItemCategory({
    required this.name,
    required this.categoryID,
    required this.parentID,
  });

  factory ItemCategory.fromJson(Map<String, dynamic> json) {
    return ItemCategory(
      name: json['categoryname'],
      categoryID: json['categoryid'],
      parentID: json['parentcategory'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'categoryname': name,
      'categoryid': categoryID,
      'parentcategory': parentID,
    };
  }

  @override
  String toString() {
    return 'Category{name: $name, categoryID: $categoryID, parentID: $parentID}';
  }
}
