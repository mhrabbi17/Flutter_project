import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/ui/screens/Forgot_Password_OTP_Screen.dart';
import 'package:task_manager/ui/screens/Sign-in_Screen.dart';
import 'package:task_manager/ui/utils/AppColour.dart';
import 'package:task_manager/ui/widgets/ScreenBackground.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
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
                  "Set Password",
                  style: textTheme.titleLarge
                      ?.copyWith(fontWeight: FontWeight.w600),
                ),
                Text(
                  "Minimum password should be 8 letters",
                  style: textTheme.titleSmall?.copyWith(color: Colors.grey),
                ),
                const SizedBox(
                  height: 24,
                ),
                _buildResetPasswordForm(),
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

  Widget _buildResetPasswordForm() {
    return Column(
      children: [
        TextFormField(
          decoration: InputDecoration(hintText: "Password"),
        ),
        const SizedBox(
          height: 24,
        ),
        TextFormField(
          obscureText: true,
          decoration: InputDecoration(hintText: "Confirm Password"),
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
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => SignInScreen(),
        ),
            (_) => false
    );
  }

  void _onTapSignIn() {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => SignInScreen(),
        ),
        (_) => false
    );
  }
}
