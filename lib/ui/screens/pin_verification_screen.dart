import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:tm/ui/screens/sign_in_screen.dart';
import 'package:tm/ui/widgets/screen_background.dart';

import 'change_password_screen.dart';


class PinVerificationScreen extends StatefulWidget {
  const PinVerificationScreen({super.key});

  static const String name = '/pin-verification';

  @override
  State<PinVerificationScreen> createState() => _PinVerificationScreenState();
}

class _PinVerificationScreenState extends State<PinVerificationScreen> {
  final TextEditingController _otpTEcontroller = TextEditingController();
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
                     Text("Pin Verification", style: Theme.of(context).textTheme.titleLarge,),
                     Text("A 6 digit OTP has been send to your email address", style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Colors.grey),),
                     const SizedBox(height: 50,),
                     PinCodeTextField(
                       length: 6,
                       keyboardType: TextInputType.number,
                       animationType: AnimationType.fade,
                       pinTheme: PinTheme(
                         shape: PinCodeFieldShape.box,
                         borderRadius: BorderRadius.circular(5),
                         fieldHeight: 50,
                         fieldWidth: 40,
                         activeFillColor: Colors.white,
                         selectedColor: Colors.green,
                         inactiveColor: Colors.grey
                       ),
                       animationDuration: Duration(milliseconds: 300),
                       backgroundColor: Colors.transparent,
                       controller: _otpTEcontroller,
                       appContext: context,

                     ),
                     const SizedBox(height: 20,),
                     ElevatedButton(onPressed: _onTapSubmitButton,
                         child: Text('Verify')),
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
    Get.toNamed(ChangePasswordScreen.name);
  }

  void _onTapSignIn(){
    Get.toNamed(SignInScreen.name);
  }


  @override
  void dispose() {
    _otpTEcontroller.dispose();
    super.dispose();
  }


}
