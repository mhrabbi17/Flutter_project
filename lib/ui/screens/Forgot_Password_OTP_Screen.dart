import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:task_manager/ui/screens/Reset_Password_Screen.dart';
import 'package:task_manager/ui/screens/Sign-in_Screen.dart';
import 'package:task_manager/ui/utils/AppColour.dart';
import 'package:task_manager/ui/widgets/ScreenBackground.dart';

class ForgotPasswordOTPScreen extends StatefulWidget {
  const ForgotPasswordOTPScreen({super.key});

  @override
  State<ForgotPasswordOTPScreen> createState() =>
      _ForgotPasswordOTPScreenState();
}

class _ForgotPasswordOTPScreenState extends State<ForgotPasswordOTPScreen> {
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
                  "Pin Verification",
                  style: textTheme.titleLarge
                      ?.copyWith(fontWeight: FontWeight.w600),
                ),
                Text(
                  "A 6digit OTP has been sent to your email address",
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
        PinCodeTextField(
          length: 6,
          obscureText: false,
          keyboardType: TextInputType.number,
          animationType: AnimationType.fade,
          pinTheme: PinTheme(
              shape: PinCodeFieldShape.box,
              borderRadius: BorderRadius.circular(5),
              fieldHeight: 50,
              fieldWidth: 40,
              activeFillColor: Colors.white,
              inactiveFillColor: Colors.white,
              selectedFillColor: Colors.white),
          animationDuration: Duration(milliseconds: 300),
          backgroundColor: Colors.transparent,
          enableActiveFill: true,
          appContext: context,
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
          builder: (context) => ResetPasswordScreen(),
        ));
  }

  void _onTapSignIn() {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => SignInScreen(),
        ),
        (_) => false);
    //Navigator.pop(context);
  }
}
