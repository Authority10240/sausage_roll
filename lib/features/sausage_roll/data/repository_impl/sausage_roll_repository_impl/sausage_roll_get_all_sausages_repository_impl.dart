import 'package:injectable/injectable.dart';
import 'package:sausage_roll/core/failures/base_failure.dart';
import 'package:sausage_roll/features/sausage_roll/data/data_sources/sausage_cart_data_source.dart';
import 'package:sausage_roll/features/sausage_roll/domain/entities/sausage_roll_entity.dart';
import 'package:sausage_roll/features/sausage_roll/domain/repository/sausage_roll_repository/sausage_roll_get_all_sausages_repository.dart';
import 'package:dartz/dartz.dart';

@Injectable(as: SausageRollGetAllSausagesRepository)
class SausageRollGetAllSausagesRepositoryImpl
    extends SausageRollGetAllSausagesRepository {
  SausageRollGetAllSausagesRepositoryImpl(
      {required this.sausageCartDataSource});

  final SausageCartDataSource sausageCartDataSource;

  @override
  Future<Either<BaseFailure, List<SausageRollEntity>>> call(
      {SausageRollGetAllSausagesRepositoryParams? params}) async {
    try {
      return Right(await sausageCartDataSource.getAllSausages());
    } catch (ex) {
      rethrow;
    }
  }
}
