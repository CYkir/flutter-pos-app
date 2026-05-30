// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter_pos_app/data/models/table_resto_model.dart';

class TableRestoInfoPage extends StatelessWidget {
  final TableRestoModel tableRestoModel;

  const TableRestoInfoPage({Key? key, required this.tableRestoModel})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Info Table Resto')),
      body: Center(child: Text('${tableRestoModel.name}')),
    );
  }
}
