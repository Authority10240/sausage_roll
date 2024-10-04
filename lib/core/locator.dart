import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:sausage_roll/generated/l10n.dart';
import 'locator.config.dart';

GetIt locator = GetIt.instance;

@InjectableInit(
    initializerName: 'init', preferRelativeImports: true, asExtension: true)
void setupLocators() => locator.init();

@module
abstract class RegisterModules {
  S get appLocalizations => S();
}
