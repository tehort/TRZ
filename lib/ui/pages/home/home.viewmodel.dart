import 'package:mobx/mobx.dart';
part 'home.viewmodel.g.dart';

class HomeViewModel = HomeViewModelBase with _$HomeViewModel;

abstract class HomeViewModelBase with Store {
  @observable
  int activeTabIndex = 0;

  @observable
  int previousTabIndex = 0;

  @action
  void setTabIndex(int index) {
    previousTabIndex = activeTabIndex;
    activeTabIndex = index;
  }
}
