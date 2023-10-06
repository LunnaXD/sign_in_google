import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_oauth/home_screen.dart';
import 'package:sign_in_oauth/service.dart';
import 'package:sign_in_oauth/user_info.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return LoginScreenState();
  }
}

class LoginScreenState extends State<LoginScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            ElevatedButton(
              onPressed: () => _signIn(),
              child: const Text('Sign in with Google'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _signIn() async {
    try {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Sign in button clicked'),
      ));

      GoogleSignInAccount? googleSignInAccount = await GoogleService.instance.gSignIn.signIn();
      GoogleSignInAuthentication? authentication =
          await googleSignInAccount?.authentication;

      if (googleSignInAccount != null && authentication != null) {
        final String userName = googleSignInAccount.displayName ?? '';
        final String userEmail = googleSignInAccount.email;
        final String userPicture = googleSignInAccount.photoUrl ?? '';
        final String userId = googleSignInAccount.id;
        final UserInfoDetails userInfo = UserInfoDetails(authentication.accessToken, userName, userEmail, userPicture, userId);


        //-----------FIREBASE------------------
        // AuthCredential credential = GoogleAuthProvider.credential(
        //   accessToken: authentication.accessToken,
        //   idToken: authentication.idToken,
        // );
        //
        // UserCredential user = await _fAuth.signInWithCredential(credential);
        // UserInfoDetails userInfo = UserInfoDetails(
        //     user.user?.tenantId,
        //     user.user?.displayName,
        //     user.user?.email,
        //     user.user?.photoURL,
        //     user.user?.uid);

        print("User Name : ${userInfo.displayName}");
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (ctx) => HomeScreen(detailsUser: userInfo),
          ),
        );
      }
    } catch (e) {
      print(e);
    }
  }
}
