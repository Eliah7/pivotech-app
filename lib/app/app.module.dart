import 'package:bfastui/adapters/module.dart';
import 'package:bfastui/adapters/router.dart';
import 'package:bfastui/bfastui.dart';
import 'package:pivotech/account/account.module.dart';
import 'package:pivotech/issue/issue.module.dart';

class PivotechApp extends BFastUIMainModule {
  @override
  void initRoutes(String moduleName) {
    BFastUI.navigation(moduleName: moduleName)
        .addRoute(
          BFastUIRouter('/issue',
              module: BFastUI.childModule(IssueModule())),
        )
        .addRoute(BFastUIRouter('/account',
            module: BFastUI.childModule(AccountModule())));
  }

  @override
  void initStates(String moduleName) {}
}
