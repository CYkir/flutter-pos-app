import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_pos_app/ui/menu/bloc/get_table_restoes/get_table_restoes_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TableRestoPage extends StatefulWidget {
  const TableRestoPage({super.key});

  @override
  State<TableRestoPage> createState() => _TableRestoPageState();
}

class _TableRestoPageState extends State<TableRestoPage> {
  late GetTableRestoesBloc getTableRestoesBloc;

  @override
  void initState() {
    super.initState();
    getTableRestoesBloc = context.read<GetTableRestoesBloc>()..add(
      TableRestoesFetched()
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Table Resto"),
      ),
    );
  }
}
