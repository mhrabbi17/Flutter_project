import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/ui/screens/Forgot_Password_OTP_Screen.dart';
import 'package:task_manager/ui/utils/AppColour.dart';
import 'package:task_manager/ui/widgets/ScreenBackground.dart';

class ForgotPasswordEmailScreen extends StatefulWidget {
  const ForgotPasswordEmailScreen({super.key});

  @override
  State<ForgotPasswordEmailScreen> createState() =>
      _ForgotPasswordEmailScreenState();
}

class _ForgotPasswordEmailScreenState extends State<ForgotPasswordEmailScreen> {
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: ScreenBackground(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 82,
                ),
                Text(
                  "Your Email Address",
                  style: textTheme.titleLarge
                      ?.copyWith(fontWeight: FontWeight.w600),
                ),
                Text(
                  "A 6digit OTP will be sent to your email address",
                  style: textTheme.titleSmall?.copyWith(color: Colors.grey),
                ),
                const SizedBox(
                  height: 24,
                ),
                _buildEmailVerifyForm(),
                const SizedBox(height: 48),
                Center(
                  child: _buildHaveAccountSection(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildEmailVerifyForm() {
    return Column(
      children: [
        TextFormField(
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(hintText: "Email"),
        ),
        const SizedBox(
          height: 24,
        ),
        ElevatedButton(
            onPressed: () {
              _onTapNextButton();
            },
            child: Icon(Icons.arrow_forward)),
      ],
    );
  }

  Widget _buildHaveAccountSection() {
    return RichText(
        text: TextSpan(
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: 16,
                letterSpacing: .5),
            text: "Have Account?",
            children: [
          TextSpan(
              text: "Sign In",
              style: TextStyle(color: AppColour.themecolor),
              recognizer: TapGestureRecognizer()..onTap = _onTapSignIn)
        ]));
  }

  void _onTapNextButton() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ForgotPasswordOTPScreen(),
      ),
    );
  }

  void _onTapSignIn() {
    Navigator.pop(context);
  }
}
