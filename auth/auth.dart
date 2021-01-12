import 'package:cloud_firestore/cloud_firestore.dart';
import "package:firebase_auth/firebase_auth.dart";
import "../models/user.dart";

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final Firestore _firestore = Firestore.instance;

  static User loggedInUser = null;

  // creates a User object with the FirebaseUser information
  User _userFromFirebaseUser(FirebaseUser user) {
    _createUser(user); // creates a user with the firestore information that can then be accessed using AuthService.loggedInUser
    return user != null ? User(id: user.uid) : null;
  }

  // a stream that is used to keep track if the user is signed in or not
  Stream<User> get user {
    return _auth.onAuthStateChanged.map((FirebaseUser user) => _userFromFirebaseUser(user));
  }

  Future signInWithEmailAndPassword({email, password}) async {
    try {
      final FirebaseUser user = (await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      ))
          .user;

      return _userFromFirebaseUser(user);
    } catch (error) {
      print("error logging in: $error");
    }
  }

  void _createUser(FirebaseUser user) async {
    final firestoreUserInformation = await _firestore.collection("users").document(user.uid).get();

    AuthService.loggedInUser = User(id: user.uid, userName: firestoreUserInformation["userName"], email: firestoreUserInformation["email"]);
  }

  void signOut() {
    _auth.signOut();
  }

  Future<String> signUp({email, password}) async {
    final result = await _auth.createUserWithEmailAndPassword(email: email, password: password);

    final user = result.user;
    return user.uid;
  }
}
