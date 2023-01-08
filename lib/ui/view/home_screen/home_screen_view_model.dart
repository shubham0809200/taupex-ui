import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:stacked/stacked.dart';
import 'package:taupex/services/firebase_auth_service.dart';

class HomeScreenViewModel extends BaseViewModel {
  Stream<QuerySnapshot> get stream => getData();

  Stream<QuerySnapshot> getData() {
    return FirebaseAuthService().getCollection();
  }

  // selected bar
  bool upcomming = true;
  bool laterThisMonth = false;

  void onLaterThisMonth() {
    laterThisMonth = true;
    upcomming = false;
    notifyListeners();
  }

  void onUpcomming() {
    laterThisMonth = false;
    upcomming = true;
    notifyListeners();
  }

  calculateDays(date) {
    final DateTime today = DateTime.now();
    final int days = date.difference(today).inDays;
    return days;
  }
}
