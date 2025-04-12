import 'package:algoload_flutter_web_app/src/core/_barrel.dart';
import 'package:algoload_flutter_web_app/src/features/algoview/domain/_barrel.dart';
import 'package:dartz/dartz.dart' hide State;
import 'package:injectable/injectable.dart';

abstract class AlgoViewUseCasePrototype {
  const AlgoViewUseCasePrototype(this.algoViewRepository);

  final IAlgoViewRepository algoViewRepository;
}

@singleton
class AlgoViewReciveTask extends AlgoViewUseCasePrototype {
  const AlgoViewReciveTask(super.algoViewRepository);

  // todo
  Future<Either<Failure, void>> call(ReciveTaskForm form) async {
    final result = await algoViewRepository.reciveTask(form);
    if (result.isLeft()) return result;

    return const Right(null);
  }
}
