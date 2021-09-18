import 'package:dartz/dartz.dart';

import 'failures.dart';

export 'package:dartz/dartz.dart';

class NoInput {}

abstract class UseCase<InputType, OutputType> {
  Future<Either<Failure, OutputType>> call(InputType input);
}
