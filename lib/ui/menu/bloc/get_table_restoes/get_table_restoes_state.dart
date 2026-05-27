part of 'get_table_restoes_bloc.dart';

@immutable
sealed class GetTableRestoesState {}

final class GetTableRestoesInitial extends GetTableRestoesState {}

final class getTableRestoesLoading extends GetTableRestoesState {}

final class getTableRestoesLoaded extends GetTableRestoesState {
  final List<TableRestoModel> list;

  getTableRestoesLoaded({required this.list});
}

final class getTableRestoesError extends GetTableRestoesState {
  final String message;

  getTableRestoesError(this.message);
}
