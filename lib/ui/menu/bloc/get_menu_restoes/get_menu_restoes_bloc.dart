import 'package:bloc/bloc.dart';
import 'package:flutter_pos_app/data/models/menu_resto_model.dart';
import 'package:meta/meta.dart';

part 'get_menu_restoes_event.dart';
part 'get_menu_restoes_state.dart';

class GetMenuRestoesBloc extends Bloc<GetMenuRestoesEvent, GetMenuRestoesState> {
  GetMenuRestoesBloc() : super(GetMenuRestoesInitial()) {
    on<GetMenuRestoesEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
