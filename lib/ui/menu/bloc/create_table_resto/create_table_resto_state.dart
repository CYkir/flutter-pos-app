part of 'create_table_resto_bloc.dart';

@immutable
sealed class CreateTableRestoState {}

final class CreateTableRestoInitial extends CreateTableRestoState {}

final class CreateTableRestoLoading extends CreateTableRestoState {}

final class CreateTableRestoSuccess extends CreateTableRestoState {
  final TableRestoNewResponse tableRestoNewResponse;

  CreateTableRestoSuccess({required this.tableRestoNewResponse});
}

final class CreateTableRestoError extends CreateTableRestoState {
  final String message;

  CreateTableRestoError({required this.message});
}
