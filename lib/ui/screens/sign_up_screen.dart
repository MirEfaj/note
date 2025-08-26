import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tm/ui/widgets/screen_background.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  static const String name = '/sign-up';

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailTEcontroller = TextEditingController();
  final TextEditingController _firstNameTEcontroller = TextEditingController();
  final TextEditingController _lastNameTEcontroller = TextEditingController();
  final TextEditingController _phoneTEcontroller = TextEditingController();
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
                     Text("Join With Us", style: Theme.of(context).textTheme.titleLarge,),
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
                       controller: _firstNameTEcontroller,
                       keyboardType: TextInputType.name,
                       textInputAction: TextInputAction.next,
                       decoration: InputDecoration(
                         hintText: "First Name",
                         prefixIcon: Icon(Icons.person_outline)
                       ),
                       validator:(String? value){
                         if(value?.isEmpty ?? true){
                           return "Enter Your First Name";
                         } return null;
                       },
                     ),
                     const SizedBox(height: 10,),
                     TextFormField(
                       controller: _lastNameTEcontroller,
                       keyboardType: TextInputType.name,
                       textInputAction: TextInputAction.next,
                       decoration: InputDecoration(
                           hintText: "Last Name",
                           prefixIcon: Icon(Icons.person_outline)
                       ),
                       validator:(String? value){
                         if(value?.isEmpty ?? true){
                           return "Enter Your Last Name";
                         }return null;
                       },
                     ),
                     const SizedBox(height: 10,),
                     TextFormField(
                       controller: _phoneTEcontroller,
                       keyboardType: TextInputType.number,
                       textInputAction: TextInputAction.next,
                       decoration: InputDecoration(
                           hintText: "Phone",
                           prefixIcon: Icon(Icons.phone)
                       ),
                       validator:(String? value){
                         if(value?.isEmpty ?? true){
                           return "Enter Your Phone Number";
                         } return null;
                       },
                     ),
                     const SizedBox(height: 10,),
                     TextFormField(
                       controller: _passwordTEcontroller,
                         decoration: InputDecoration(
                             hintText: "Password",
                             prefixIcon: Icon(Icons.lock)
                         ),
                       validator: (String ? value){
                         if((value?.length ?? 0)< 6){
                           return "Enter 6 or more then chereacter";}
                         return null;
                       },
                     ),
                     const SizedBox(height: 20,),
                     ElevatedButton(onPressed: _onTapSignUpButton,
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

  void _onTapSignUpButton(){
    if(_formKey.currentState!.validate()){

    }
  }

  void _onTapSignIn(){
    Get.back();
  }

  @override
  void dispose() {
    _emailTEcontroller.dispose();
    _firstNameTEcontroller.dispose();
    _lastNameTEcontroller.dispose();
    _phoneTEcontroller.dispose();
    _passwordTEcontroller.dispose();
    super.dispose();
  }


}
