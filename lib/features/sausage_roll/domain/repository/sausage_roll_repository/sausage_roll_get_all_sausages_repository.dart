import 'package:sausage_roll/core/base_classes/base_repository.dart';
import 'package:sausage_roll/core/failures/base_failure.dart';
import 'package:dartz/dartz.dart';
import 'package:sausage_roll/features/sausage_roll/domain/entities/sausage_roll_entity.dart';

abstract class SausageRollGetAllSausagesRepository extends BaseRepository<
    SausageRollGetAllSausagesRepositoryParams,
    Either<BaseFailure, List<SausageRollEntity>>> {}

class SausageRollGetAllSausagesRepositoryParams extends BaseRepositoryParams {}
