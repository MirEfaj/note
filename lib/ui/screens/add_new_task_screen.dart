import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tm/ui/widgets/screen_background.dart';
import '../widgets/tm_app_bar.dart';
import 'forgot_pass_email_screen.dart';
import 'main_nav_bar_holder_screen.dart';
import 'sign_up_screen.dart';

class AddNewTaskScreen extends StatefulWidget {
  const AddNewTaskScreen({super.key});

  static const String name = '/add-new-task';

  @override
  State<AddNewTaskScreen> createState() => _AddNewTaskScreenState();
}

class _AddNewTaskScreenState extends State<AddNewTaskScreen> {
  final TextEditingController _titleTEcontroller = TextEditingController();
  final TextEditingController _descriptionTEcontroller = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: tmAppBar(),
       body: ScreenBackground(
           child: SingleChildScrollView(
             child: Form(
               key: _formKey,
               child: Padding(
                 padding: const EdgeInsets.all(16.0),
                 child: Column(
                   children: [
                     const SizedBox(height: 20,),
                     Text("Add New Task", style: Theme.of(context).textTheme.titleLarge,),
                     const SizedBox(height: 50,),
                     TextFormField(
                       controller: _titleTEcontroller,
                       keyboardType: TextInputType.emailAddress,
                       textInputAction: TextInputAction.next,
                       decoration: InputDecoration(
                         hintText: "Title",
                       ),
                       validator: (String ? value){
                         if(value?.trim().isEmpty ?? true){
                           return "Title here";
                         }return null;
                       },
                     ),
                     const SizedBox(height: 10,),
                     TextFormField(
                       controller: _descriptionTEcontroller,
                         maxLines: 5,
                         decoration: InputDecoration(
                             hintText: "Description",
                         ),
                       validator: (String? value) {
                         if (value?.trim().isEmpty ?? true) {
                           return "Write Your Note";
                         }
                         return null;
                       },
                     ),
                     const SizedBox(height: 20,),
                     ElevatedButton(onPressed: _onTapTaskAddButton,
                         child: Icon(Icons.arrow_circle_right_outlined)),
                   ],
                 ),
               ),
             ),
           )
       ),
    );
  }

  void _onTapTaskAddButton(){
    if(_formKey.currentState!.validate()){

    }
   // Get.back();
  }


  @override
  void dispose() {
    _titleTEcontroller.dispose();
    _descriptionTEcontroller.dispose();
    super.dispose();
  }


}
