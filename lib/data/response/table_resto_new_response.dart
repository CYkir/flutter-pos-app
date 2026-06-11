import 'package:flutter_pos_app/data/response/tabel_resto_response.dart';

class TableRestoNewResponse {
  final String message;
  final TabelRestoResponse? tableRestoResponse;

  TableRestoNewResponse({
    required this.message,
    required this.tableRestoResponse,
  });

  factory TableRestoNewResponse.fromJson(Map<String, dynamic> json) {
    TabelRestoResponse? tableRestoResponse;
    return TableRestoNewResponse(
      message: json['message'],
      tableRestoResponse: json['data'] != null
          ? TabelRestoResponse.fromJson(json['data'])
          : tableRestoResponse,
    );
  }
}
