import 'package:bloc/bloc.dart';
import 'package:flutter_pos_app/data/models/table_resto_model.dart';
import 'package:flutter_pos_app/data/repo/table_resto_repository.dart';
import 'package:meta/meta.dart';

part 'get_table_restoes_event.dart';
part 'get_table_restoes_state.dart';

class GetTableRestoesBloc
    extends Bloc<GetTableRestoesEvent, GetTableRestoesState> {
  final tableRestoRepository = TableRestoRepository();
  GetTableRestoesBloc() : super(GetTableRestoesInitial()) {
    on<GetTableRestoesEvent>((event, emit) async {
      emit(GetTableRestoesLoading());
      try {
        var response = await tableRestoRepository.getTableRestos();
        // await Future.delayed();
        emit(GetTableRestoesLoaded(list: response));
      } catch (e) {
        emit(GetTableRestoesError(e.toString()));
      }
    });
  }
}
