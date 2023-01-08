import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:stacked/stacked.dart';
import 'package:taupex/services/firebase_auth_service.dart';

class LoginScreenViewModel extends BaseViewModel {
  String get title => 'taupex';

  List<Map<String, String>> splashData = [
    {"text": "Welcome to TauPex, Let's shop!", "image": "assets/splash_1.png"},
    {
      "text": "This Application allows you to pay bills in one place",
      "image": "assets/splash_2.png"
    },
  ];

  // current page
  int currentPage = 0;

  changePage(int value) {
    currentPage = value;
    notifyListeners();
  }

  // Sign in with google use firebase_auth_service.dart
  Future<bool> signInWithGoogle() async {
    try {
      return await FirebaseAuthService().signInWithGoogle();
    } catch (e) {
      return false;
    }
  }

  
}
