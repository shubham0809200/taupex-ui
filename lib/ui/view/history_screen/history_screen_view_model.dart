import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:stacked/stacked.dart';
import 'package:taupex/constants/dummy_data.dart';
import 'package:taupex/models/chart.model.dart';
import 'package:taupex/services/firebase_auth_service.dart';
import 'package:intl/intl.dart';

class HistoryScreenViewModel extends BaseViewModel {
  String get title => 'History Screen';

  Stream<QuerySnapshot> get stream => getData();

  Stream<QuerySnapshot> getData() {
    return FirebaseAuthService().getCollection();
  }

  // selected month
  String selectedMonth = 'January';

  void changeMonth(String month) {
    selectedMonth = month;
    notifyListeners();
  }

  // dummy data for chart with the help of paymentData
  List<ChartData> get chartData {
    List<ChartData> data = [];
    for (var i = 0; i < paymentData.length; i++) {
// convert duedate to day
      final DateTime date = DateTime.parse(paymentData[i].dueDate);

      data.add(ChartData(
        day: int.parse(DateFormat('d').format(date)),
        value: int.parse(paymentData[i].amount),
      ));
    }
    return data;
  }
}
