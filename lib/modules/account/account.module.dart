import 'package:bfastui/adapters/module.dart';
import 'package:bfastui/adapters/router.dart';
import 'package:bfastui/bfastui.dart';
import 'package:pivotech/modules/account/pages/login-form.page.dart';
import 'package:pivotech/modules/account/pages/login.page.dart';
import 'package:pivotech/modules/account/states/login.state.dart';

class AccountModule extends BFastUIChildModule{
  @override
  void initRoutes(String moduleName) {
       BFastUI.navigation(moduleName: moduleName)
        .addRoute(BFastUIRouter(
          '/',
          guards: [],
          page: (context, args) => LoginPage(),
        )).addRoute(BFastUIRouter(
          '/loginForm',
          guards: [],
          page: (context, args) => LoginFormPage(),
        ));
  }
  
  @override
  void initStates(String moduleName) {
    BFastUI.states(moduleName: moduleName)
        .addState((_) => LoginState());
  }

  @override
  String moduleName() {
    return 'account';
  }

}