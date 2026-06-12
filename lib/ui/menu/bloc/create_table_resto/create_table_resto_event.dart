part of 'create_table_resto_bloc.dart';

@immutable
sealed class CreateTableRestoEvent {}

final class TableRestoCreated extends CreateTableRestoEvent {
  final TableRestoParam tableRestoParam;
  TableRestoCreated({required this.tableRestoParam});
}

final class TableRestoUpdated extends CreateTableRestoEvent {
  final int id;
  final TableRestoParam tableRestoParam;

  TableRestoUpdated({required this.id, required this.tableRestoParam});
}
