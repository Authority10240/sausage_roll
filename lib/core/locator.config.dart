// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../features/bottom_navigation_page/presentation/bloc/bottom_navigation_page_bloc.dart'
    as _i409;
import '../features/cart/data/data_source/local/sausage_roll-local_data_source_impl.dart'
    as _i1069;
import '../features/cart/data/data_source/local/sausage_roll_local_data_source.dart'
    as _i929;
import '../features/cart/data/data_source/remote/sausage_roll_remote_data_source.dart'
    as _i670;
import '../features/cart/data/data_source/remote/sausage_roll_remote_data_source_impl.dart'
    as _i818;
import '../features/cart/data/repository_impl/cart_repository_impl/cart_page_add_item_repository_impl.dart'
    as _i705;
import '../features/cart/data/repository_impl/cart_repository_impl/cart_page_get_sausage_roll_repository_impl.dart'
    as _i921;
import '../features/cart/domain/repository/cart_repository/cart_page_add_item_repository.dart'
    as _i76;
import '../features/cart/domain/repository/cart_repository/cart_page_get_sausage_roll_repository.dart'
    as _i332;
import '../features/cart/domain/use_cases/cart_usecase/cart_page_add_item_usecase.dart'
    as _i31;
import '../features/cart/domain/use_cases/cart_usecase/cart_page_get_sausage_roll_usecase.dart'
    as _i321;
import '../features/cart/presentation/bloc/cart_bloc.dart' as _i421;
import '../features/sausage_roll/data/data_sources/local/sausage_cart_data_source.dart'
    as _i46;
import '../features/sausage_roll/data/data_sources/local/sausage_cart_data_source_impl.dart'
    as _i1018;
import '../features/sausage_roll/domain/repository/sausage_roll_repository/sausage_roll_get_all_sausages_repository.dart'
    as _i920;
import '../features/sausage_roll/domain/use_cases/sausage_roll_usecase/sausage_roll_get_all_sausages_usecase.dart'
    as _i686;
import '../features/sausage_roll/presentation/bloc/sausage_roll_page_bloc.dart'
    as _i517;
import '../generated/l10n.dart' as _i504;
import 'locator.dart' as _i775;
import 'sembast_database/custom_sembast_database.dart' as _i264;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModules = _$RegisterModules();
    gh.factory<_i504.S>(() => registerModules.appLocalizations);
    gh.factory<_i409.BottomNavigationPageBloc>(
        () => _i409.BottomNavigationPageBloc());
    gh.factory<_i517.SausageRollBloc>(() => _i517.SausageRollBloc());
    gh.singleton<_i264.CustomSembastDatabase>(
        () => _i264.CustomSembastDatabase());
    gh.singleton<_i670.SausageRollRemoteDataSource>(
        () => _i818.SausageRollRemoteDataSourceImpl());
    gh.singleton<_i46.SausageCartDataSource>(
        () => _i1018.SausageCartDataSourceImpl());
    gh.factory<_i686.SausageRollGetAllSausagesUseCase>(() =>
        _i686.SausageRollGetAllSausagesUseCase(
            sausageRollGetAllSausagesRepository:
                gh<_i920.SausageRollGetAllSausagesRepository>()));
    gh.singleton<_i929.SausageRollLocalDataSource>(() =>
        _i1069.SausageRolllocalDataSourceImpl(
            db: gh<_i264.CustomSembastDatabase>()));
    gh.factory<_i76.CartPageAddItemRepository>(() =>
        _i705.CartPageAddItemRepositoryImpl(
            sausageRollLocalDataSource:
                gh<_i929.SausageRollLocalDataSource>()));
    gh.factory<_i332.CartPageGetSausageRollRepository>(() =>
        _i921.CartPageGetSausageRollRepositoryImpl(
            sausageRollRemoteDataSource:
                gh<_i670.SausageRollRemoteDataSource>()));
    gh.factory<_i31.CartPageAddItemUseCase>(() => _i31.CartPageAddItemUseCase(
        cartPageAddItemRepository: gh<_i76.CartPageAddItemRepository>()));
    gh.factory<_i321.CartPageGetSausageRollUseCase>(() =>
        _i321.CartPageGetSausageRollUseCase(
            cartPageGetSausageRollRepository:
                gh<_i332.CartPageGetSausageRollRepository>()));
    gh.factory<_i421.CartBloc>(() => _i421.CartBloc(
          cartPageGetSausageRollUseCase:
              gh<_i321.CartPageGetSausageRollUseCase>(),
          cartPageAddItemUseCase: gh<_i31.CartPageAddItemUseCase>(),
        ));
    return this;
  }
}

class _$RegisterModules extends _i775.RegisterModules {}
