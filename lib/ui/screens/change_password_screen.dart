import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tm/ui/screens/sign_in_screen.dart';
import 'package:tm/ui/widgets/screen_background.dart';
import 'forgot_pass_email_screen.dart';
import 'sign_up_screen.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  static const String name = '/change-password';

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final TextEditingController _passwordTEcontroller = TextEditingController();
  final TextEditingController _confirmPassTEcontroller = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: ScreenBackground(
           child: SingleChildScrollView(
             child: Form(
               key: _formKey,
               child: Padding(
                 padding: const EdgeInsets.all(16.0),
                 child: Column(
                   children: [
                     const SizedBox(height: 50,),
                     Text("Change Password", style: Theme.of(context).textTheme.titleLarge,),
                     Text("Password should be more than 6 letters", style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Colors.grey),),
                     const SizedBox(height: 50,),
                     TextFormField(
                       controller: _passwordTEcontroller,
                       decoration: InputDecoration(
                           hintText: "New Password",
                           prefixIcon: Icon(Icons.lock)
                       ),
                       validator: (String? value) {
                         if ((value?.length ?? 0) < 6) {
                           return "Enter at least 6 characters";
                         }
                         return null;
                       },

                     ),
                     const SizedBox(height: 10,),
                     TextFormField(
                       controller: _confirmPassTEcontroller,
                         decoration: InputDecoration(
                             hintText: "Confirm Password",
                             prefixIcon: Icon(Icons.lock)
                         ),
                       validator: (String ? value){
                         if(value != _passwordTEcontroller.text){
                           return "Confirm doesn't match";
                         }return  null;
                       },
                     ),
                     const SizedBox(height: 20,),
                     ElevatedButton(onPressed: _onTapSubmitButton,
                         child: Icon(Icons.arrow_circle_right_outlined)),
             
                     const SizedBox(height: 50,),

                     RichText(
                         text: TextSpan(
                           text: "Have an account ? ",
                           style: TextStyle(fontWeight: FontWeight.w600,color: Colors.black,wordSpacing: 0.4 ),
                           children: [
                             TextSpan(
                               text: "Sign In",
                               style: TextStyle(fontWeight: FontWeight.w600,color: Colors.green ),
                               recognizer: TapGestureRecognizer()..onTap = _onTapSignIn
                             )
                           ]
                         )
                     )
                   ],
                 ),
               ),
             ),
           )
       ),
    );
  }

  void _onTapSubmitButton(){
    if(_formKey.currentState!.validate()){

    }

  }

  void _onTapSignIn(){
    Get.toNamed(SignInScreen.name);
  }


  @override
  void dispose() {
    _confirmPassTEcontroller.dispose();
    _passwordTEcontroller.dispose();
    super.dispose();
  }


}
