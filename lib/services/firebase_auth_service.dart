import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  get user => _auth.currentUser;

  final CollectionReference usersCollection =
      FirebaseFirestore.instance.collection('user');

  Future<bool> signInWithGoogle() async {
    bool res = false;
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication googleAuth =
          await googleUser!.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      // await _auth.signInWithCredential(credential);
      // return true;
      UserCredential userCredential =
          await _auth.signInWithCredential(credential);
      res = true;
    } on FirebaseAuthException catch (e) {
      Fluttertoast.showToast(msg: e.message.toString());
      res = false;
    } catch (e) {
      // handle the error here
      Fluttertoast.showToast(msg: e.toString());
    }
    return res;
  }

  // Sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
      return null;
    }
  }

  Stream<QuerySnapshot> getCollection() {
    try {
      return usersCollection.snapshots();
    } on FirebaseException catch (e) {
      Fluttertoast.showToast(msg: e.message.toString());
      rethrow;
    }
  }
}
