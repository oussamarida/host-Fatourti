import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:last_livrai/screens/Home.dart';
import 'package:last_livrai/screens/auth.dart';

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          final user = snapshot.data;
          if (user != null) {
            return Home(user: user);
          } else {
            return Auth();
          }
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }
}
