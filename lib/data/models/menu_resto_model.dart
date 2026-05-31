// ignore_for_file: public_member_api_docs, sort_constructors_first
class MenuRestoModel {
  final int? id;
  final String? code;
  final String? name;
  final String? price;
  final String? description;
  final String? imageMenu;
  final String? category;
  final String? menuStatus;
  final int? status;

  MenuRestoModel({
    required this.id,
    required this.code,
    required this.name,
    required this.price,
    required this.description,
    required this.imageMenu,
    required this.category,
    required this.menuStatus,
    required this.status,
  });

  //untuk get data
  factory MenuRestoModel.fromJson(Map<String, dynamic> json) {
    return MenuRestoModel(
      id: json['id'],
      code: json['code'],
      name: json['name'],
      price: json['price'],
      description: json['description'],
      imageMenu: json['imageMenu'],
      category: json['category'],
      menuStatus: json['menuStatus'],
      status: json['status'],
    );
  }
}
