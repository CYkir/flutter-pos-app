import 'package:flutter/material.dart';
import 'package:flutter_pos_app/data/models/table_resto_model.dart';
import 'package:flutter_pos_app/ui/menu/bloc/get_table_restoes/get_table_restoes_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos_app/ui/menu/pages/table_resto_info_page.dart';

class TableResto extends StatelessWidget {
  const TableResto({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetTableRestoesBloc(),
      child: TableRestoPage(),
    );
  }
}

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
    getTableRestoesBloc = context.read<GetTableRestoesBloc>()
      ..add(TableRestoesFetched());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Table Resto"),
      ),
      body: BlocBuilder<GetTableRestoesBloc, GetTableRestoesState>(
        builder: (context, state) {
          return switch (state) {
            GetTableRestoesInitial() || GetTableRestoesLoading() => Center(
              child: CircularProgressIndicator(),
            ),

            GetTableRestoesLoaded() =>
              state.list.isEmpty
                  ? const Center(child: Text("Data Masih Kosong ...."))
                  : Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          mainAxisSpacing: 4,
                          crossAxisSpacing: 4,
                        ),
                        itemBuilder: (_, index) {
                          TableRestoModel tableRestoModel = state.list[index];
                          return GestureDetector(
                            onTap: () {
                              debugPrint('Tap ${state.list[index].name}');
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => TableRestoInfoPage(
                                    tableRestoModel: tableRestoModel,
                                  ),
                                ),
                              );
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(color: Colors.grey),
                                color: state.list[index].tableStatus == 'Terisi'
                                    ? Theme.of(
                                        context,
                                      ).colorScheme.inversePrimary
                                    : Colors.grey.shade100,
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    '${state.list[index].name}',
                                    style: Theme.of(
                                      context,
                                    ).textTheme.titleMedium,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.min,
                                    spacing: 5,
                                    children: [
                                      Icon(Icons.people),
                                      Text('${state.list[index].capacity}'),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                        itemCount: state.list.length,
                      ),
                    ),
            // TODO: Handle this case.
            GetTableRestoesError() => Center(child: Text(state.message)),
          };
        },
      ),
    );
  }
}
