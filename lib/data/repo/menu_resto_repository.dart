import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_pos_app/core/api_client.dart';
import 'package:flutter_pos_app/data/models/menu_resto_model.dart';

class MenuRestoRepository extends ApiClient {
  Future<List<MenuRestoModel>> getMenuRestoes() async {
    try {
      var response = await dio.get('menu-resto-list');
      debugPrint('GET ALL MENU : ${response.data}');

      List list = response.data;
      List<MenuRestoModel> listMenuResto = list
          .map((element) => MenuRestoModel.fromJson((element)))
          .toList();
      return listMenuResto;
    } on DioException catch (e) {
      debugPrint('Error : ${e.toString()}');
      throw Exception(e);
    }
  }
}
