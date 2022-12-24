import './injectable.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

final getItInstance = GetIt.instance;

@injectableInit
GetIt configureDependencies() => getItInstance.init();
