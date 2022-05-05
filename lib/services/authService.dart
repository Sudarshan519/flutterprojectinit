import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  var authInstance = FirebaseAuth.instance;
  authChanges() async {
    User? currentUser;
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        currentUser = user;
        print('User is currently signed out!');
      } else {
        currentUser = null;
        print('User is signed in!');
      }
    });
    return currentUser;
  }

  signin(String email, String password) async {
    try {
      var userCred = await authInstance.signInWithEmailAndPassword(
          email: email, password: password);
      return userCred.user;
    } on FirebaseAuthException catch (e) {
      print(e.message);
    }
  }

  signup(String email, String password) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  getUser() {
    final user = FirebaseAuth.instance.currentUser;
  }

  updateUser(User user) async {
    await user.updateDisplayName("Jane Q. User");
    await user.updatePhotoURL("https://example.com/jane-q-user/profile.jpg");
  }

  updateEmail(user) async {
    await user?.updateEmail("janeq@example.com");
  }

  signout() async {
    await FirebaseAuth.instance.signOut();
  }
}
