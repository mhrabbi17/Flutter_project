import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/data/models/network_response.dart';
import 'package:task_manager/data/services/network_caller.dart';
import 'package:task_manager/data/utils/urls.dart';
import 'package:task_manager/ui/utils/AppColour.dart';
import 'package:task_manager/ui/widgets/ScreenBackground.dart';
import 'package:task_manager/ui/widgets/centered_circular_progress_indicator.dart';
import 'package:task_manager/ui/widgets/snack_bar_message.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _firstNameTEController = TextEditingController();
  final TextEditingController _lastNameTEController = TextEditingController();
  final TextEditingController _mobileTEController = TextEditingController();
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
                const SizedBox(height: 82,),
                Text("Join With Us", style: textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w600),),
                const SizedBox(height: 24,),
                _buildSignUpForm(),
                const SizedBox(height: 24),
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
  Widget _buildSignUpForm() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: _emailTEController,
            keyboardType: TextInputType.emailAddress,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: InputDecoration(
                hintText: "Email"
            ),
            validator: (String? value){
              if(value?.isEmpty ?? true){
                return "Enter valid Email";
              }
              return null;
            },
          ),
          SizedBox(height: 8,),
          TextFormField(
            controller: _firstNameTEController,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: InputDecoration(
                hintText: "First Name"
            ),
            validator: (String? value){
              if(value?.isEmpty ?? true){
                return "Enter first Name";
              }
              return null;
            },
          ),
          SizedBox(height: 8,),
          TextFormField(
            controller: _lastNameTEController,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: InputDecoration(
                hintText: "Last Name"
            ),
            validator: (String? value){
              if(value?.isEmpty ?? true){
                return "Enter Last Name";
              }
              return null;
            },
          ),
          SizedBox(height: 8,),
          TextFormField(
            controller: _mobileTEController,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(
                hintText: "Mobile Number"
            ),
            validator: (String? value){
              if(value?.isEmpty ?? true){
                return "Enter Mobile Number";
              }
              return null;
            },
          ),
          SizedBox(height: 8,),
          TextFormField(
            controller: _passwordTEController,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: InputDecoration(
                hintText: "Password"
            ),
            validator: (String? value){
              if(value?.isEmpty ?? true){
                return "Enter your Password";
              }
              return null;
            },
          ),
          const SizedBox(height: 24,),
          Visibility(
            visible: !_inProgress,
            replacement:CenteredCircularProgressIndicator(),
            child: ElevatedButton(
                onPressed: () {_onTapNextButton();} ,
                child: Icon(Icons.arrow_forward)
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHaveAccountSection() {
    return RichText(
        text: TextSpan(
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: 16,
                letterSpacing: .5
            ),
            text: "Have Account?",
            children:[
              TextSpan(
                  text: "Sign In",
                  style: TextStyle(
                      color: AppColour.themecolor
                  ),
                  recognizer: TapGestureRecognizer()..onTap = _onTapSignIn
              )
            ]
        )
    );
  }
  void _onTapForgotPasswordButton(){
    // TODO: implement on tap forget Password
  }

  void _onTapNextButton(){
    if(_formKey.currentState!.validate()){
      _signUp();
    }
  }

  Future<void> _signUp() async{
    _inProgress = true ;
    setState(() {});
    Map<String,dynamic> requestBody = {
      "email": _emailTEController.text.trim(),
      "firstName":_firstNameTEController.text.trim(),
      "lastName":_lastNameTEController.text.trim(),
      "mobile":_mobileTEController.text.trim(),
      "password":_passwordTEController.text,
    };

    NetworkResponse response = await NetworkCaller.postRequest(
        url: URLs.registration,
        body: requestBody
    );
    _inProgress = false;
    setState(() {});
    if(response.isSuccess){
      _clearTextField();
      showSnackBarMessage(context, "New User Created");
    }
    else{
      showSnackBarMessage(context, response.errorMessage, true);
    }
  }

  void _clearTextField(){
    _emailTEController.clear();
    _firstNameTEController.clear();
    _lastNameTEController.clear();
    _mobileTEController.clear();
    _passwordTEController.clear();
  }
  void _onTapSignIn(){
    Navigator.pop(context);
  }

  @override
  void dispose() {
    _emailTEController.dispose();
    _firstNameTEController.dispose();
    _lastNameTEController.dispose();
    _mobileTEController.dispose();
    _passwordTEController.dispose();
    super.dispose();
  }
}
