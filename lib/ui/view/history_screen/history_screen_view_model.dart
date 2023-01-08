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

    int Jan = 0;
    int Feb = 0;
    int Mar = 0;
    int Apr = 0;
    int May = 0;
    int Jun = 0;
    int Jul = 0;
    int Aug = 0;
    int Sep = 0;
    int Oct = 0;
    int Nov = 0;
    int Dec = 0;
    for (var i = 0; i < paymentData.length; i++) {
// convert duedate to month
      final DateTime date = DateTime.parse(paymentData[i].dueDate);
      final String month = DateFormat('MMM').format(date);
      if (month == 'Jan') {
        Jan += int.parse(paymentData[i].amount);
      } else if (month == 'Feb') {
        Feb += int.parse(paymentData[i].amount);
      } else if (month == 'Mar') {
        Mar += int.parse(paymentData[i].amount);
      } else if (month == 'Apr') {
        Apr += int.parse(paymentData[i].amount);
      } else if (month == 'May') {
        May += int.parse(paymentData[i].amount);
      } else if (month == 'Jun') {
        Jun += int.parse(paymentData[i].amount);
      } else if (month == 'Jul') {
        Jul += int.parse(paymentData[i].amount);
      } else if (month == 'Aug') {
        Aug += int.parse(paymentData[i].amount);
      } else if (month == 'Sep') {
        Sep += int.parse(paymentData[i].amount);
      } else if (month == 'Oct') {
        Oct += int.parse(paymentData[i].amount);
      } else if (month == 'Nov') {
        Nov += int.parse(paymentData[i].amount);
      } else if (month == 'Dec') {
        Dec += int.parse(paymentData[i].amount);
      }
    }
    data.add(ChartData(
      day: 1,
      value: Jan,
    ));
    data.add(ChartData(
      day: 2,
      value: Feb,
    ));
    data.add(ChartData(
      day: 3,
      value: Mar,
    ));
    data.add(ChartData(
      day: 4,
      value: Apr,
    ));
    data.add(ChartData(
      day: 5,
      value: May,
    ));
    data.add(ChartData(
      day: 6,
      value: Jun,
    ));
    data.add(ChartData(
      day: 7,
      value: Jul,
    ));
    data.add(ChartData(
      day: 8,
      value: Aug,
    ));
    data.add(ChartData(
      day: 9,
      value: Sep,
    ));
    data.add(ChartData(
      day: 10,
      value: Oct,
    ));
    data.add(ChartData(
      day: 11,
      value: Nov,
    ));
    data.add(ChartData(
      day: 12,
      value: Dec,
    ));
    return data;
  }

  calculateDays(date) {
    final DateTime today = DateTime.now();
    final int days = date.difference(today).inDays;
    return days;
  }
}
