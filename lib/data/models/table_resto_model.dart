class TableRestoModel {
  final int? id;
  final String? code;
  final int? capacity;
  final String? tablestatus;
  final String? status;

  TableRestoModel({
    required this.id,
    required this.code,
    required this.capacity,
    required this.tablestatus,
    required this.status,
  });

  // untuk Get Data
  factory TableRestoModel.fromJson(Map<String, dynamic> json) {
    return TableRestoModel(
      id          : json['id'],
      code        : json['code'],
      capacity    : json['capacity'],
      tablestatus : json['table_status'],
      status      : json['status'],
    );
  }
}
