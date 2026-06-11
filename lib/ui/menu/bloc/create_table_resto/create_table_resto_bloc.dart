import 'package:bloc/bloc.dart';
import 'package:flutter_pos_app/data/param/table_resto_param.dart';
import 'package:flutter_pos_app/data/repo/table_resto_repository.dart';
import 'package:flutter_pos_app/data/response/table_resto_new_response.dart';
import 'package:meta/meta.dart';

part 'create_table_resto_event.dart';
part 'create_table_resto_state.dart';

class CreateTableRestoBloc
    extends Bloc<CreateTableRestoEvent, CreateTableRestoState> {
  final tableRestoRepository = TableRestoRepository();
  CreateTableRestoBloc() : super(CreateTableRestoInitial()) {
    on<TableRestoCreated>((event, emit) async {
      final tableRestoParam = TableRestoParam(
        event.tableRestoParam.code,
        event.tableRestoParam.name,
        event.tableRestoParam.capacity,
        event.tableRestoParam.tableStatus,
        event.tableRestoParam.status,
      );
      try {
        TableRestoNewResponse response = await tableRestoRepository.addTableResto(
          tableRestoParam,
        );
        emit(CreateTableRestoSuccess(tableRestoNewResponse: response));
      } catch (e) {
        emit(CreateTableRestoError(message: e.toString()));
      }
    });
  }
}
