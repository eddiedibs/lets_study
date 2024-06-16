import 'package:flutter_modular/flutter_modular.dart';
import 'package:lets_study_flutter/routes/app_routes.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute('/', module: MainModule()),
  ];
}
