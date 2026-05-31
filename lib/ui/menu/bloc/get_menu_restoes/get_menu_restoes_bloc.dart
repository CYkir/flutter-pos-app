import 'package:bloc/bloc.dart';
import 'package:flutter_pos_app/data/models/menu_resto_model.dart';
import 'package:flutter_pos_app/data/repo/menu_resto_repository.dart';
import 'package:meta/meta.dart';

part 'get_menu_restoes_event.dart';
part 'get_menu_restoes_state.dart';

class GetMenuRestoesBloc
    extends Bloc<GetMenuRestoesEvent, GetMenuRestoesState> {
  final menuRestoRepository = MenuRestoRepository();

  GetMenuRestoesBloc() : super(GetMenuRestoesInitial()) {
    on<GetMenuRestoesEvent>((event, emit) async {
      // TODO: implement event handler
      emit(GetMenuRestoLoading());
      try {
        var response = await menuRestoRepository.getMenuRestoes();
        emit(GetMenuRestoLoaded(list: response));
      } catch (e) {
        emit(GetMenuRestoError(e.toString()));
      }
    });
  }
}
