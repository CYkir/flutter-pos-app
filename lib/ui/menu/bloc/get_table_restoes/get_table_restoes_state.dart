part of 'get_table_restoes_bloc.dart';

@immutable
sealed class GetTableRestoesState {}

final class GetTableRestoesInitial extends GetTableRestoesState {}

final class GetTableRestoesLoading extends GetTableRestoesState {}

final class GetTableRestoesLoaded extends GetTableRestoesState {
  final List<TableRestoModel> list;

  GetTableRestoesLoaded({required this.list});
}

final class GetTableRestoesError extends GetTableRestoesState {
  final String message;

  GetTableRestoesError(this.message);
}
