import 'package:equatable/equatable.dart';

class Failure extends Equatable {
  const Failure({required this.description});

  final String description;

  @override
  List<Object> get props {
    return [description];
  }
}

final class LocalFailure extends Failure {
  const LocalFailure({required super.description});
}

final class UnknownFailure extends Failure {
  const UnknownFailure({required super.description});
}

final class ServerFailure extends Failure {
  const ServerFailure({required super.description});
}

final class CacheFailure extends Failure {
  const CacheFailure({required super.description});
}

class SerializationFailure extends Failure {
  const SerializationFailure({required super.description});
}
