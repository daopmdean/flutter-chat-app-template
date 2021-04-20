import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn _googleSignIn = GoogleSignIn();

class Authentication {
  static Future<User> signInWithGoogle() async {
    // ToDo 1: Implements signInWithGoogle()
    return null;
  }

  static Future<void> signOutGoogle() async {
    // ToDo 2: Implements signOutGoogle()
  }
}
