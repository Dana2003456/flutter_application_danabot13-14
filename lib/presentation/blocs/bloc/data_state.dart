import 'package:flutter_application_danabot/data/models/page.dart';

abstract class DataState {}

class DataInitial extends DataState {}

class DataLoading extends DataState {}

class DataLoaded extends DataState {
  final List<Comment> comments;

  DataLoaded({required this.comments});
}

class DataError extends DataState {
  final String message;

  DataError({required this.message});

  DataError.namedConstructor(this.message);
}
