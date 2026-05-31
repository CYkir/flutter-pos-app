part of 'get_menu_restoes_bloc.dart';

@immutable
sealed class GetMenuRestoesState {}

final class GetMenuRestoesInitial extends GetMenuRestoesState {}

final class GetMenuRestoLoading extends GetMenuRestoesState {}

final class GetMenuRestoLoaded extends GetMenuRestoesState {
  final List<MenuRestoModel> list;

  GetMenuRestoLoaded({required this.list});
}

final class GetMenuRestoError extends GetMenuRestoesState {
  final String message;

  GetMenuRestoError({required this.message});
}
