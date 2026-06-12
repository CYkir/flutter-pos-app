// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_pos_app/data/models/table_resto_model.dart';
import 'package:flutter_pos_app/ui/menu/bloc/create_table_resto/create_table_resto_bloc.dart';
import 'package:flutter_pos_app/ui/menu/pages/table_resto_form.dart';

class TableRestoInfoPage extends StatelessWidget {
  final TableRestoModel tableRestoModel;

  const TableRestoInfoPage({super.key, required this.tableRestoModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Info Table Resto')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          spacing: 10,
          children: [
            ListTile(title: Text('Kode : ${tableRestoModel.code}')),
            ListTile(title: Text('Nama Meja : ${tableRestoModel.name}')),
            ListTile(title: Text('Capacity :${tableRestoModel.capacity}')),
            ListTile(
              title: Text('Status Meja: ${tableRestoModel.tableStatus}'),
            ),
            ListTile(title: Text('Status : ${tableRestoModel.status}')),
            Container(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.inversePrimary,
                  foregroundColor: Theme.of(context).colorScheme.secondary,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => BlocProvider(
                        create: (context) => CreateTableRestoBloc(),
                        child: TableRestoForm(),
                      ),
                    ),
                  );
                },
                child: Text(
                  'UBAH DATA',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
