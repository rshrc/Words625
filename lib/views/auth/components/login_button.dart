// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:words625/shared/firebase_authentication.dart';

class LoginButton extends StatefulWidget {
  final FirebaseAuthentication auth;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  const LoginButton(this.auth, this.emailController, this.passwordController,
      {Key? key})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return LoginButtonState();
  }
}

class LoginButtonState extends State<LoginButton> {
  String loginMessage = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(loginMessage),
        Container(padding: const EdgeInsets.all(5)),
        Container(
          width: double.infinity,
          height: 50,
          margin: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
          padding: const EdgeInsets.only(bottom: 2),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF1CB0F6),
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            onPressed: loginPressed,
            child: const Text(
              'SIGN IN',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }

  loginPressed() {
    String userId = '';
    String email = widget.emailController.text;
    String password = widget.passwordController.text;
    widget.auth.login(email, password).then((value) {
      print('Login Info: $email - $password');
      if (value == null) {
        setState(() {
          print('login failed');
          loginMessage = 'Login Error';
        });
      } else {
        userId = value;
        setState(() {
          print('login successfully');
          loginMessage = 'User $userId successfully logged in';
        });
      }
    });
  }
}

////// create user
// else {
// auth.createUser(txtUserName.text, txtPassword.text).then((value) {
// if (value == null) {
// setState(() {
// _message = 'Registration Error';
// });
// } else {
// userId = value;
// setState(() {
// _message = 'User $userId successfully signed in';
// });
// }
// });
// };
