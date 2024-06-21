import 'package:flutter_modular/flutter_modular.dart';
import 'package:lets_study_flutter/presentation/router/app_routes.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
    // Other bindings...
  ];
  @override
  final List<ModularRoute> routes = [
    ModuleRoute('/', module: MainModule()),
  ];
}
