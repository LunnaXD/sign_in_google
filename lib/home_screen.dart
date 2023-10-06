import 'package:flutter/material.dart';
import 'package:sign_in_oauth/login_screen.dart';
import 'package:sign_in_oauth/service.dart';
import 'package:sign_in_oauth/user_info.dart';

class HomeScreen extends StatelessWidget {
  final UserInfoDetails detailsUser;

  const HomeScreen({Key? key, required this.detailsUser}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
        appBar: AppBar(
          title: const Text('Google Sign In Details'),
        ),
        body: Scrollbar(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                "Name : ${detailsUser.displayName}",
                style: textTheme.bodyLarge,
              ),
              const Padding(
                padding: EdgeInsets.all(5.0),
              ),
              Text(
                "Email : ${detailsUser.email}",
                style: textTheme.bodyMedium,
              ),
              const Padding(
                padding: EdgeInsets.all(5.0),
              ),
              Text(
                "Photo URL : ${detailsUser.photoUrl}",
                style: textTheme.bodySmall,
              ),
              const Padding(
                padding: EdgeInsets.all(5.0),
              ),
              Text(
                "Token : ${detailsUser.token}",
                style: textTheme.bodySmall,
              ),
              const Padding(
                padding: EdgeInsets.all(5.0),
              ),
              Text(
                "UiD : ${detailsUser.uid}",
                style: textTheme.bodySmall,
              ),
              ElevatedButton(
                onPressed: () => _signOut(context),
                child: const Text('Sign Out'),
              ),
            ],
          ),
        ));
  }

  void _signOut(BuildContext context) async {
    try {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Sign out button clicked'),
      ));

      await GoogleService.instance.gSignIn.signOut();
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Signed out SUCCESS'),
      ));

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (ctx) => LoginScreen(),
        ),
      );
    } catch (e) {
      print(e);
    }
  }
}
