import 'package:firebase_auth/firebase_auth.dart';
import 'package:dsv_watersocial/models/user.dart';
//import 'package:flutter_firebase/services/database.dart';

//import 'notification_service.dart';

class AuthenticationService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
   
  //AppUser _userFromFirebaseUser(User user) {
  AppUser? _userFromFirebaseUser(User? user) {
  //   initUser(user);
    //return user != null ? AppUser(uid: user.uid) : null;
    return user != null ? AppUser(user.uid) : null;
  }

  // void initUser(User? user) async {
  //   if (user == null) return;
  //   NotificationService.getToken().then((value) {
  //     DatabaseService(user.uid).saveToken(value);
  //   });
  // }

  // Stream<AppUser?> get user {
    Stream<AppUser? > get user {
     return _auth.authStateChanges().map(_userFromFirebaseUser);
    }

  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result =
          await _auth.signInWithEmailAndPassword(email: email, password: password);
      User user = result.user;
      //User? user = result.user;
      //return user;
      return _userFromFirebaseUser(user);
    } catch (exception) {
      print(exception.toString());
      return null;
    }
  }
  
  Future registerWithEmailAndPassword(String email, String password) async {
  //Future registerWithEmailAndPassword(String name, String email, String password) async {
    try {
      UserCredential result =
          await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User user = result.user;
      //User? user = result.user;

      //TODO Store new user in Firestore
      // if (user == null) {
      //   throw Exception("No user found");
      // } else {
      //   await DatabaseService(user.uid).saveUser(name, 0);

      //   return _userFromFirebaseUser(user);
      // }
      //return user;
      return _userFromFirebaseUser(user);
    } catch (exception) {
      print(exception.toString());
      return null;
    }
  }

  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (exception) {
      print(exception.toString());
      return null;
    }
  }
}
