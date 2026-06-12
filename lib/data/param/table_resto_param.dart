class TableRestoParam {
  final String? code;
  final String? name;
  final int? capacity;
  final String? tableStatus;
  final String? status;

  TableRestoParam(
    this.code,
    this.name,
    this.capacity,
    this.tableStatus,
    this.status,
  );

  // for post
  Map<String, dynamic> toJsonNew() {
    return {'code': code, 'name': name, 'capacity': capacity};
  }

// Update
  Map<String, dynamic> toJsonUpdate() {
    return {
      'code' : code,
      'name': name,
      'capacity': capacity,
      'table_status': tableStatus,
      'status': status,
    };
  }
}
