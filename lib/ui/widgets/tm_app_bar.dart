import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tm/ui/screens/sign_in_screen.dart';
import '../screens/update_profile_screen.dart';

class tmAppBar extends StatefulWidget implements PreferredSizeWidget{
  const tmAppBar({
    super.key,
  });

  static const String = '/update-profile';

  @override
  State<tmAppBar> createState() => _tmAppBarState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class _tmAppBarState extends State<tmAppBar> {
  @override
  Widget build(BuildContext context) {

    return AppBar(
      backgroundColor: Colors.green,
      title: Row(
        children: [
          GestureDetector(
              onTap: _onTapUpdateProfile,
              child: CircleAvatar()),
          SizedBox(width: 10,),
          Expanded(child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Md Efaj Alam",style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Colors.white),),
              Text("mdefaj@gmail.com",style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: Colors.white),),
            ],
          )),
          IconButton(onPressed: _onTapLogOutButton, icon: Icon(Icons.logout_outlined))
        ],
      ),);
  }



  void _onTapUpdateProfile(){
    if(ModalRoute.of(context)!.settings.name != UpdateProfileScreen.name){
    Get.toNamed(UpdateProfileScreen.name);}
  }

  void _onTapLogOutButton(){
    Get.offAllNamed(SignInScreen.name);
  }
}