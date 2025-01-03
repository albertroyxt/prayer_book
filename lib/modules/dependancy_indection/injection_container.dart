import 'injection_container.config.dart';
import 'package:injectable/injectable.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: 'init',
)

Future<void> configureDependencies () async => getIt.init();

