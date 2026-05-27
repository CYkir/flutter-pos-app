part of 'get_table_restoes_bloc.dart';

@immutable
sealed class GetTableRestoesEvent {}

final class TableRestoesFetched extends GetTableRestoesEvent {}
