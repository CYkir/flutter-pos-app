import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_pos_app/core/api_client.dart';
import 'package:flutter_pos_app/data/models/table_resto_model.dart';
import 'package:flutter_pos_app/data/param/table_resto_param.dart';
import 'package:flutter_pos_app/data/response/table_resto_new_response.dart';

class TableRestoRepository extends ApiClient {
  Future<List<TableRestoModel>> getTableRestos() async {
    try {
      var response = await dio.get('table-resto');
      debugPrint('Get all table Resto : ${response.data}');
      List list = response.data;

      List<TableRestoModel> listTableResto = list
          .map((element) => TableRestoModel.fromJson((element)))
          .toList();

      return listTableResto;
    } on DioException catch (e) {
      debugPrint('Error : ${e.toString()}');
      throw Exception(e);
    }
  }

  Future<TableRestoNewResponse> addTableResto(
    TableRestoParam tableRestoParam,
  ) async {
    try {
      var response = await dio.post(
        'table-resto',
        data: tableRestoParam.toJsonNew(),
      );
      debugPrint('POST Table Resto : ${response.data}');
      return TableRestoNewResponse.fromJson(response.data);

    } on DioException catch (e) {
      throw Exception(e);
    }
  }
}
