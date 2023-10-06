import 'package:google_sign_in/google_sign_in.dart';

class GoogleService{

  GoogleService._privateConstructor();

  static final GoogleService _instance = GoogleService._privateConstructor();

  static GoogleService get instance => _instance;

  // final FirebaseAuth _fAuth = FirebaseAuth.instance;
  final GoogleSignIn gSignIn = GoogleSignIn(
    serverClientId: "[YOUR_CLIENT_ID]",
    scopes: ['openid', 'profile', 'email'],
  );
}