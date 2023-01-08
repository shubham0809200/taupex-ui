import 'package:stacked/stacked.dart';
import 'package:taupex/services/firebase_auth_service.dart';

class ProfileScreenViewModel extends BaseViewModel {
  String get title => 'Profile Screen';

  // logout function

  Future signOut() async {
    await FirebaseAuthService().signOut();
    // nevigate back to login screen
  }
}
