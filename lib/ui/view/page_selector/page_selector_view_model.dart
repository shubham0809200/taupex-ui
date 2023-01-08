import 'package:stacked/stacked.dart';
import 'package:taupex/ui/view/card_screen/card_screen_view.dart';
import 'package:taupex/ui/view/history_screen/history_screen_view.dart';
import 'package:taupex/ui/view/home_screen/home_screen_view.dart';
import 'package:taupex/ui/view/profile_screen/profile_screen_view.dart';

class PageSelectorViewModel extends BaseViewModel {
  int pageIndex = 0;
  String get title => 'Page Selector';

  final pages = [
    const HomeScreenView(),
    const HistoryScreenView(),
    const CardScreenView(),
    const ProfileScreenView()
  ];

  void setPageIndex(int index) {
    pageIndex = index;
    notifyListeners();
  }
}
