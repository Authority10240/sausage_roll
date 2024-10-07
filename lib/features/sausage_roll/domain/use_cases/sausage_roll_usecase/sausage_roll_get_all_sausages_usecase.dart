import 'package:dartz/dartz.dart';
import 'package:sausage_roll/core/base_classes/base_usecase.dart';
import 'package:sausage_roll/core/failures/base_failure.dart';
import 'package:sausage_roll/features/sausage_roll/domain/entities/sausage_roll_entity.dart';
import 'package:sausage_roll/features/sausage_roll/domain/repository/sausage_roll_repository/sausage_roll_get_all_sausages_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class SausageRollGetAllSausagesUseCase extends BaseUseCase<
    SausageRollGetAllSausagesUseCaseParams,
    Either<BaseFailure, List<SausageRollEntity>>> {
  final SausageRollGetAllSausagesRepository sausageRollGetAllSausagesRepository;

  SausageRollGetAllSausagesUseCase(
      {required this.sausageRollGetAllSausagesRepository});

  @override
  Future<Either<BaseFailure, List<SausageRollEntity>>> call(
      {SausageRollGetAllSausagesUseCaseParams? params}) async {
    try {
      return await sausageRollGetAllSausagesRepository.call();
    } catch (ex) {
      return Future.value(Left(BaseFailure.factory(ex: ex)));
    }
  }
}

class SausageRollGetAllSausagesUseCaseParams extends BaseUseCaseParams {}
