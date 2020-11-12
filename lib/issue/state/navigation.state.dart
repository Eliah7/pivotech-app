
import 'package:bfastui/adapters/state.dart';
import 'package:bfastui/bfastui.dart';
import 'package:pivotech/issue/pages/navigation.page.dart';

class NavigationState extends BFastUIState{
  var selectedTab = NavTabs.HOME;
  var selectedIndex = 0;

  changeSelectedTab({NavTabs tabName}){
    // print(selectedIndex);
    this.selectedTab = getSelectedTab();
    // notifyListeners();
  }

  changeSelectedIndex(int index){
    this.selectedIndex = index;
    this.selectedTab = getSelectedTab();
    notifyListeners();
  }


  getSelectedTab(){
    switch (selectedIndex) {
      case 0:
        return NavTabs.HOME;
        break;
      case 1:
        return NavTabs.HISTORY;
        break;
      case 2:
        return NavTabs.SETTINGS;
        break;
      default:
    }
    // notifyListeners();
  }
}