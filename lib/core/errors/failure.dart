import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
// import 'package:vms/common/widgets/base_error_entity.dart';
// import 'package:vms/features/auth/domain/entities/auth_error_Entity.dart';

class Failure extends Equatable {
  final String message;
  const Failure(this.message);

  @override
  List<Object?> get props => [message];
}

class ServerFailure extends Failure {
  const ServerFailure(super.message, {this.errorMessage});

  final String? errorMessage;

  @override
  List<Object?> get props => [errorMessage];
}

// class BaseResponseFailure extends Failure {
//   const BaseResponseFailure(
//     super.message, {
//     required this.baseErrorEntity,
//   });

//   final BaseErrorEntity baseErrorEntity;
// }

class InputFieldFailure extends Failure {
  const InputFieldFailure(super.message, {required this.errorMessage});

  final String? errorMessage;

  @override
  List<Object?> get props => [errorMessage];
}

//text field failures
class EmptyFieldFailure extends Failure {
  const EmptyFieldFailure(super.message);
}

class InvalidInputFailure extends Failure {
  const InvalidInputFailure(super.message);
}

class DioFailure extends Failure {
  const DioFailure(super.message, {required this.error, this.errorMessage});
  final String? errorMessage;

  final DioException error;

  @override
  List<Object?> get props => [error, errorMessage];
}

class DateParseFailure extends Failure {
  const DateParseFailure(
    super.message, {
    required this.errorMessage,
  });

  final String? errorMessage;

  @override
  List<Object?> get props => [errorMessage];
}
