// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:auto_route/annotations.dart';

// Project imports:
import 'package:words625/views/auth/components/components.dart';

@RoutePage()
class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _LoginPageState();
  }
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  String loginMessage = '';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const LoginAppBar(),
      body: Container(
        margin: const EdgeInsets.only(bottom: 10),
        child: Column(
          children: [
            Form(
              key: formKey,
              child: InputField(emailController, passwordController),
            ),
            // Text(loginMessage),
            // Container(margin: const EdgeInsets.only(top: 10)),
            LoginButton(emailController, passwordController),
            Container(margin: const EdgeInsets.only(top: 10)),
            const ForgotPassword(),
            bottomDisplay(),
          ],
        ),
      ),
    );
  }

  bottomDisplay() {
    return const Expanded(
      child: Align(
        alignment: FractionalOffset.bottomCenter,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              // mainAxisSize: MainAxisSize.max,
              children: [
                FacebookButton(),
                GoogleButton(),
              ],
            ),
            PolicyText(),
          ],
        ),
      ),
    );
  }
}
