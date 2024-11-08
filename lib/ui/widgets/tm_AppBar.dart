import 'package:flutter/material.dart';
import 'package:task_manager/ui/controllers/auth_controller.dart';
import 'package:task_manager/ui/screens/Profile_Screen.dart';
import 'package:task_manager/ui/screens/Sign-in_Screen.dart';
import 'package:task_manager/ui/utils/AppColour.dart';

class TMAppBar extends StatelessWidget implements PreferredSizeWidget{
  const TMAppBar({
    super.key,
     this.isProfileScreenOpen = false,
  });
  final bool isProfileScreenOpen;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if(isProfileScreenOpen){
          return;
        }
        Navigator.push(context,
          MaterialPageRoute(
            builder: (context) => const ProfileScreen(),
          ),
        );
      },
      child: AppBar(
          backgroundColor: AppColour.themecolor,
          title: Row(
            children: [
              CircleAvatar(
                radius: 16,
                backgroundColor: Colors.white,
              ),
              SizedBox(width: 16,),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Mahabub Hossain Rabbi",style: TextStyle(fontSize: 16,color: Colors.white,fontWeight: FontWeight.w600),),
                    Text("rabbi.0028@gmail.com",style: TextStyle(fontSize: 12,color: Colors.white,fontWeight: FontWeight.w600),),
                  ],
                ),
              ),
              IconButton(
                  onPressed:() async{
                    await AuthController.clearUserData();
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => SignInScreen(),), (_)=>false);
                    },
                  icon: Icon(Icons.logout)
              )
            ],
          )),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight)  ;
}