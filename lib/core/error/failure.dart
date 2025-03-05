import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;
  const Failure(this.message, [List properties = const <dynamic>[]]);
}

// General failures
class ServerFailure extends Failure {
  const ServerFailure(super.message);

  @override
  List<Object?> get props => [];
}

class CacheFailure extends Failure {
  const CacheFailure(super.message);

  @override
  List<Object?> get props => [];
}
