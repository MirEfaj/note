import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tm/ui/screens/add_new_task_screen.dart';
import 'package:tm/ui/screens/forgot_pass_email_screen.dart';
import 'package:tm/ui/screens/main_nav_bar_holder_screen.dart';
import 'package:tm/ui/screens/sign_in_screen.dart';
import 'package:tm/ui/screens/update_profile_screen.dart';
import 'ui/screens/change_password_screen.dart';
import 'ui/screens/pin_verification_screen.dart';
import 'ui/screens/splash_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static GlobalKey<NavigatorState> navigator = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorSchemeSeed: Colors.green,
        textTheme: TextTheme(titleLarge: TextStyle(fontSize: 28, fontWeight: FontWeight.w700)),

        inputDecorationTheme: InputDecorationTheme(
            filled: true,
            fillColor: Colors.grey.shade300,
            hintStyle: TextStyle(color: Colors.grey),
            contentPadding: EdgeInsets.symmetric(horizontal: 18, vertical: 5),
            border: OutlineInputBorder(borderSide: BorderSide.none),
            errorBorder: OutlineInputBorder(borderSide: BorderSide.none),
            enabledBorder: OutlineInputBorder(borderSide: BorderSide.none),
            focusedBorder: OutlineInputBorder(borderSide: BorderSide.none),
        ),

        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              fixedSize: Size.fromWidth(double.maxFinite),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
              padding: EdgeInsets.all(10),
              foregroundColor: Colors.white,
              backgroundColor: Colors.green
          ),
        )



      ),


      home: SplashScreen(),
      initialRoute: SplashScreen.name,
      routes: {
        SplashScreen.name : (context)=> SplashScreen(),
        SignInScreen.name : (context)=> SignInScreen(),
        ForgotPassEmailScreen.name : (context)=> ForgotPassEmailScreen(),
        PinVerificationScreen.name : (context)=> PinVerificationScreen(),
        ChangePasswordScreen.name : (context)=> ChangePasswordScreen(),
        MainNavBarHolderScreen.name : (context)=> MainNavBarHolderScreen(),
        AddNewTaskScreen.name : (context)=> AddNewTaskScreen(),
        UpdateProfileScreen.name : (context)=> UpdateProfileScreen(),

      },
    );
  }
}
