// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:drico_chat/data/network/api_service.dart' as _i4;
import 'package:drico_chat/di/injectable_module.dart' as _i9;
import 'package:drico_chat/features/authentication/data/auth_remote_data_source.dart'
    as _i5;
import 'package:drico_chat/features/authentication/data/auth_repo.dart' as _i8;
import 'package:drico_chat/features/chatting_list/data/chatting_list_data_source.dart'
    as _i6;
import 'package:drico_chat/features/chatting_list/data/chatting_list_repo.dart'
    as _i7;
import 'package:get_it/get_it.dart' as _i1;
import 'package:http/http.dart' as _i3;
import 'package:injectable/injectable.dart' as _i2;

/// ignore_for_file: unnecessary_lambdas
/// ignore_for_file: lines_longer_than_80_chars
extension GetItInjectableX on _i1.GetIt {
  /// initializes the registration of main-scope dependencies inside of [GetIt]
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final injectableModule = _$InjectableModule();
    gh.lazySingleton<_i3.Client>(() => injectableModule.client);
    gh.lazySingleton<_i4.ApiClient>(() => _i4.ApiClient(gh<_i3.Client>()));
    gh.lazySingleton<_i5.AuthRemoteDataSource>(
        () => _i5.AuthRemoteDataSourceImpl(apiClient: gh<_i4.ApiClient>()));
    gh.lazySingleton<_i6.ChattingListDataSource>(
        () => _i6.ImplChattingListDataSource(gh<_i4.ApiClient>()));
    gh.lazySingleton<_i7.ChattingListRepo>(
        () => _i7.ImplChattingListRepo(gh<_i6.ChattingListDataSource>()));
    gh.lazySingleton<_i8.IAuthRepo>(
        () => _i8.AuthRepo(remoteDataSource: gh<_i5.AuthRemoteDataSource>()));
    return this;
  }
}

class _$InjectableModule extends _i9.InjectableModule {}
