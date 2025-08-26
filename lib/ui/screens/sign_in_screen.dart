import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tm/ui/widgets/screen_background.dart';
import 'forgot_pass_email_screen.dart';
import 'main_nav_bar_holder_screen.dart';
import 'sign_up_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  static const String name = '/sign-in';

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _emailTEcontroller = TextEditingController();
  final TextEditingController _passwordTEcontroller = TextEditingController();
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
                     Text("Get Started With", style: Theme.of(context).textTheme.titleLarge,),
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
                     const SizedBox(height: 10,),
                     TextFormField(
                       controller: _passwordTEcontroller,
                         decoration: InputDecoration(
                             hintText: "Password",
                             prefixIcon: Icon(Icons.lock)
                         ),
                       validator: (String? value) {
                         if ((value?.length ?? 0) < 6) {
                           return "Enter at least 6 characters";
                         }
                         return null;
                       },
                     ),
                     const SizedBox(height: 20,),
                     ElevatedButton(onPressed: _onTapSignInButton,
                         child: Icon(Icons.arrow_circle_right_outlined)),
             
                     const SizedBox(height: 50,),
                     TextButton(onPressed: _onTapForgotButton, child: Text("Forgot Password",style: TextStyle(color: Colors.grey),)),
                     RichText(
                         text: TextSpan(
                           text: "Don't have an account ? ",
                           style: TextStyle(fontWeight: FontWeight.w600,color: Colors.black,wordSpacing: 0.4 ),
                           children: [
                             TextSpan(
                               text: "Sign Up",
                               style: TextStyle(fontWeight: FontWeight.w600,color: Colors.green ),
                               recognizer: TapGestureRecognizer()..onTap = _onTapSignUp
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

  void _onTapSignInButton(){
    if(_formKey.currentState!.validate()){

    }
    Get.offAllNamed(MainNavBarHolderScreen.name);
  }
  void _onTapForgotButton(){
    Get.toNamed(ForgotPassEmailScreen.name);
  }
  void _onTapSignUp(){
    Get.toNamed(SignUpScreen.name);
  }


  @override
  void dispose() {
    _emailTEcontroller.dispose();
    _passwordTEcontroller.dispose();
    super.dispose();
  }


}
