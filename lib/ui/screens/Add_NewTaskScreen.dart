import 'package:flutter/material.dart';
import 'package:task_manager/data/models/network_response.dart';
import 'package:task_manager/data/services/network_caller.dart';
import 'package:task_manager/data/utils/urls.dart';
import 'package:task_manager/ui/widgets/centered_circular_progress_indicator.dart';
import 'package:task_manager/ui/widgets/snack_bar_message.dart';
import 'package:task_manager/ui/widgets/tm_AppBar.dart';

class AddNewtaskscreen extends StatefulWidget {
  const AddNewtaskscreen({super.key});

  @override
  State<AddNewtaskscreen> createState() => _AddNewtaskscreenState();
}

class _AddNewtaskscreenState extends State<AddNewtaskscreen> {
  final TextEditingController _titleTEController = TextEditingController();
  final TextEditingController _descriptionTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _addNewTaskInProgress = false;
  bool _shouldRefresPreviousPage = false ;
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult:(didpop, result){
        if(didpop){
          return;
        }
        Navigator.pop(context,_shouldRefresPreviousPage);
      } ,
      child: Scaffold(
        appBar: TMAppBar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 42,),
                  Text("Add New Task", style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w600
                  ),),
                  const SizedBox(height: 24 ,),
                  TextFormField(
                    controller: _titleTEController,
                    decoration: const InputDecoration(hintText: "Title"),
                    validator: (String? value){
                      if(value?.trim().isEmpty?? true){
                        return "Enter a Value";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 8 ,),
                  TextFormField(
                    controller: _descriptionTEController,
                    decoration: const InputDecoration(hintText: "Description"),
                    validator: (String? value){
                      if(value?.trim().isEmpty?? true){
                        return "Enter a Value";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16 ,),
                  Visibility(
                    visible: !_addNewTaskInProgress,
                    replacement: const CenteredCircularProgressIndicator(),
                    child: ElevatedButton(
                        onPressed: _onTapSubmitButton ,
                        child: Icon(Icons.arrow_circle_right_outlined)),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  void _onTapSubmitButton(){
    if(_formKey.currentState!.validate()){
      _addNewTask();
    }
  }
  Future<void> _addNewTask()async{
    _addNewTaskInProgress = true;
    setState(() {});

    Map<String, dynamic> requestBody = {
      "title": _titleTEController.text.trim(),
      "description": _descriptionTEController.text.trim(),
      "status":"New"
    };
    final NetworkResponse response = await NetworkCaller.postRequest(
      url: URLs.addNewTask,
      body: requestBody,
    );
    _addNewTaskInProgress = false;
    setState(() {});
    if(response.isSuccess){
      _shouldRefresPreviousPage = true;
      _clearTextFields();
      showSnackBarMessage(context, "New Task Added!");
    }
    else{
      showSnackBarMessage(context, response.errorMessage, true);
    }
  }
  void _clearTextFields(){
    _titleTEController.clear();
    _descriptionTEController.clear();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    _descriptionTEController.dispose();
    _titleTEController.dispose();
    super.dispose();
  }
}
