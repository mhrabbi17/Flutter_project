import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/data/models/network_response.dart';
import 'package:task_manager/data/services/network_caller.dart';
import 'package:task_manager/data/utils/urls.dart';
import 'package:task_manager/ui/controllers/auth_controller.dart';
import 'package:task_manager/ui/screens/Forgot_Password_Email_Screen.dart';
import 'package:task_manager/ui/screens/Sing-up_Screen.dart';
import 'package:task_manager/ui/screens/main_bottom_nav_bar_screen.dart';
import 'package:task_manager/ui/utils/AppColour.dart';
import 'package:task_manager/ui/widgets/ScreenBackground.dart';
import 'package:task_manager/ui/widgets/centered_circular_progress_indicator.dart';
import 'package:task_manager/ui/widgets/snack_bar_message.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final GlobalKey<FormState>_formKey = GlobalKey<FormState>();
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();
  bool _inProgress = false;
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
                  "Get Started With!",
                  style: textTheme.titleLarge
                      ?.copyWith(fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 24,
                ),
                _buildSignInForm(),
                const SizedBox(height: 24),
                Center(
                  child: Column(
                    children: [
                      TextButton(
                        onPressed: () {
                          _onTapForgotPasswordButton();
                        },
                        child: const Text(
                          "Forgot Password?",
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                      _buildSignUpSection()
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSignUpSection() {
    return RichText(
        text: TextSpan(
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: 16,
                letterSpacing: .5),
            text: "Don't Have an Account?",
            children: [
          TextSpan(
              text: "Sign Up",
              style: TextStyle(color: AppColour.themecolor),
              recognizer: TapGestureRecognizer()..onTap = _onTapSignUp)
        ]));
  }

  Widget _buildSignInForm() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            controller: _emailTEController,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(hintText: "Email"),
            validator: (String? value){
              if(value?.isEmpty ?? true){
                return "Enter a Valid Email";
              }
              return null;
            },
          ),
          SizedBox(
            height: 8,
          ),
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            controller: _passwordTEController,
            obscureText: true,
            decoration: InputDecoration(hintText: "Password"),
            validator: (String? value){
              if(value?.isEmpty ?? true){
                return "Enter Your Password";
              }
              if(value!.length <= 6){
                return "Enter a Password more than 6 character";
              }
              return null;
            },
          ),
          const SizedBox(
            height: 24,
          ),
          Visibility(
            visible: !_inProgress,
            replacement: CenteredCircularProgressIndicator(),
            child: ElevatedButton(
                onPressed: () {
                  _onTapNextButton();
                },
                child: Icon(Icons.arrow_forward)),
          ),
        ],
      ),
    );
  }

  void _onTapNextButton() {
    if(!_formKey.currentState!.validate()){
      return;
    }
    _signIn();
  }

  Future<void> _signIn()async{
    _inProgress = true;
    setState(() {});
    Map<String, dynamic> requestBody = {
      "email":_emailTEController.text.trim(),
      "password":_passwordTEController.text,
    };
    final NetworkResponse response = await NetworkCaller.postRequest(
        url:URLs.login, body:requestBody);
    _inProgress = false;
    setState(() {});
    if(response.isSuccess){
      await AuthController.saveAccessToken(response.responseData['token']);
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => MainBottomNavBarScreen()),
              (_)=> false
      );
    }
    else{
      showSnackBarMessage(context, response.errorMessage, true);
    }
  }

  void _onTapForgotPasswordButton() {
    // TODO: implement on tap forget Password
    Navigator.push(context, MaterialPageRoute(builder: (context) => ForgotPasswordEmailScreen(),));
  }
  void _onTapSignUp() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const SignUpScreen(),
      ),
    );
  }
}
