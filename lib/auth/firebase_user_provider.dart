import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

import 'auth_util.dart';

class CommuteFirebaseUser {
  CommuteFirebaseUser(this.user);
  User? user;
  bool get loggedIn => user != null;
}

CommuteFirebaseUser? currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<CommuteFirebaseUser> commuteFirebaseUserStream() => FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<CommuteFirebaseUser>(
      (user) {
        currentUser = CommuteFirebaseUser(user);
        updateUserJwtTimer(user);
        return currentUser!;
      },
    );
