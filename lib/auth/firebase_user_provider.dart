import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class MPWCommuteFirebaseUser {
  MPWCommuteFirebaseUser(this.user);
  User? user;
  bool get loggedIn => user != null;
}

MPWCommuteFirebaseUser? currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<MPWCommuteFirebaseUser> mPWCommuteFirebaseUserStream() =>
    FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<MPWCommuteFirebaseUser>(
            (user) => currentUser = MPWCommuteFirebaseUser(user));
