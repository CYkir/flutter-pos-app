import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos_app/data/param/table_resto_param.dart';
import 'package:flutter_pos_app/ui/menu/bloc/create_table_resto/create_table_resto_bloc.dart';

class TableRestoForm extends StatefulWidget {
  const TableRestoForm({super.key});

  @override
  State<TableRestoForm> createState() => _TableRestoFormState();
}

class _TableRestoFormState extends State<TableRestoForm> {
  final tecCode = TextEditingController();
  final tecName = TextEditingController();
  final tecCapacity = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    tecCode.dispose();
    tecName.dispose();
    tecCapacity.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Table Resto Form')),
      body: BlocListener<CreateTableRestoBloc, CreateTableRestoState>(
        listener: (context, state) {
          // TODO: implement listener
          if (state is CreateTableRestoSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  state.tableRestoNewResponse.message),
                backgroundColor: Colors.green,
              ),
            );
          }
        },
        child: BlocBuilder<CreateTableRestoBloc, CreateTableRestoState>(
          builder: (context, state) {
            //  return switch(state){}
            if (state is CreateTableRestoLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is CreateTableRestoError) {
              return Center(
                child: Text(
                  state.message,
                  style: const TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center,
                ),
              );
            }
            return Form(
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    spacing: 20,
                    children: [
                      TextFormField(
                        controller: tecCode,
                        keyboardType: TextInputType.name,
                        validator: (value) => value == null || value.isEmpty
                            ? 'Kode meja masih kosong'
                            : null,
                        decoration: InputDecoration(
                          labelText: 'Kode Meja',
                          hintText: 'Masukkan kode meja',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                          ),
                        ),
                      ),
                      TextFormField(
                        controller: tecName,
                        keyboardType: TextInputType.name,
                        validator: (value) => value == null || value.isEmpty
                            ? 'Nama meja masih kosong'
                            : null,
                        decoration: InputDecoration(
                          labelText: 'Nama Meja',
                          hintText: 'Masukkan nama meja',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                          ),
                        ),
                      ),
                      TextFormField(
                        controller: tecCapacity,
                        keyboardType: TextInputType.number,
                        validator: (value) => value == null || value.isEmpty
                            ? 'Kapasitas meja masih kosong'
                            : null,
                        decoration: InputDecoration(
                          labelText: 'Kapasitas Meja',
                          hintText: 'Masukkan kapasitas meja',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                          ),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: 60,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Theme.of(
                              context,
                            ).colorScheme.inversePrimary,
                            foregroundColor: Theme.of(
                              context,
                            ).colorScheme.secondary,
                          ),
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              final tableRestoParam = TableRestoParam(
                                tecCode.text,
                                tecName.text,
                                int.parse(tecCapacity.text.toString()),
                                null,
                                null,
                              );
                              context.read<CreateTableRestoBloc>().add(
                                TableRestoCreated(
                                  tableRestoParam: tableRestoParam,
                                ),
                              );
                            }
                          },
                          child: Text(
                            'SIMPAN',
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
