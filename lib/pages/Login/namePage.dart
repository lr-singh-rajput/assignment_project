import 'package:assessmentoruphone1/controller/UserController.dart';
import 'package:assessmentoruphone1/pages/Login/Widgets.dart';
import 'package:assessmentoruphone1/pages/homePage/HomePage.dart;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NamePage extends StatelessWidget {
  const NamePage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    UserController userCredential =UserController();
    final authNumber = FirebaseAuth.instance.currentUser!.phoneNumber;
    return Scaffold(
      body: SafeArea(
          child: Padding(
              padding: EdgeInsets.only(top: 208,left: 16,right: 16),
            child: Column(
              children: [
                RewellWidgets(subText: "Enter Name"),
                SizedBox(height: 30,),
                ReTextFielde(
                    enterController: nameController,
                    keyboardTypee: TextInputType.text,
                    HintText: "EnterName",
                    iconName: Icons.account_circle_outlined
                ),
                
                SizedBox(height: 30,),
                ElevatedButton(onPressed: (){
                  if(nameController != null) {
                    userCredential.postApi(nameController.text,authNumber.toString(),BuildContext);
                     Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomePage(),
                        ),
                    );
                  }else{
                    print('Enter Your Name');
                  }
                }, child: Text("submit"))
              ],
            ),
          )
      ),
    );
  }
}
