import 'package:bfastui/adapters/module.dart';
import 'package:bfastui/adapters/router.dart';
import 'package:bfastui/bfastui.dart';
import 'package:pivotech/modules/issue/pages/create-issue.page.dart';
import 'package:pivotech/modules/issue/pages/navigation.page.dart';
import 'package:pivotech/modules/issue/state/navigation.state.dart';


class IssueModule extends BFastUIChildModule{
  @override
  void initRoutes(String moduleName) {
       BFastUI.navigation(moduleName: moduleName)
        .addRoute(BFastUIRouter(
          '/',
          guards: [],
          page: (context, args) => TabsNavigationPage(),
        ))
        .addRoute(BFastUIRouter(
          '/createIssue',
          guards: [],
          page: (context, args) => CreateIssuePage(),
        ));
  }
  
  @override
  void initStates(String moduleName) {
      BFastUI.states(moduleName: moduleName)
        .addState((_) => NavigationState());
  }

  @override
  String moduleName() {
    return 'issue';
  }
}