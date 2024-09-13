// Flutter imports:
import 'package:flutter/material.dart';

class ContinueButton extends StatelessWidget {
  final BuildContext context;
  const ContinueButton(this.context, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context, '/choose-language');
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF58CC02),
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: const Text(
          'CONTINUE',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
