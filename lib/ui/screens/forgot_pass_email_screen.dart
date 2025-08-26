import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:tm/ui/widgets/screen_background.dart';

import 'pin_verification_screen.dart';
import 'sign_up_screen.dart';

class ForgotPassEmailScreen extends StatefulWidget {
  const ForgotPassEmailScreen({super.key});

  static const String name = '/forgot-pass';

  @override
  State<ForgotPassEmailScreen> createState() => _ForgotPassEmailScreenState();
}

class _ForgotPassEmailScreenState extends State<ForgotPassEmailScreen> {
  final TextEditingController _emailTEcontroller = TextEditingController();
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
                     Text("Your Email Address", style: Theme.of(context).textTheme.titleLarge,),
                     Text("A 6 digit OTP will be send to your email address", style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Colors.grey),),
                     const SizedBox(height: 50,),
                     TextFormField(
                       controller: _emailTEcontroller,
                       keyboardType: TextInputType.emailAddress,
                       textInputAction: TextInputAction.next,
                       decoration: InputDecoration(
                         hintText: "Email",
                           prefixIcon: Icon(Icons.email_outlined)
                       ),
                       validator: (String ? value){
                         if(value?.isEmpty ?? true){
                           return "Enter Your Registered Email";
                         }return null;
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
    Get.toNamed(PinVerificationScreen.name);
  }

  void _onTapSignIn(){
    Get.back();
  }


  @override
  void dispose() {
    _emailTEcontroller.dispose();
    super.dispose();
  }


}
