import 'package:chat_cat_application/screens/chat_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../components/submit_button.dart';
import '../constante.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginScreen extends StatefulWidget {
  static const String idLoginScreen = "loginScreen";

  const LoginScreen({super.key});
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String? email;
  String? password;
  final _auth = FirebaseAuth.instance;
  late bool spinner = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:
      ModalProgressHUD(
            inAsyncCall: spinner,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Hero(
                    tag: 'logo',
                    child: SizedBox(
                      height: 200.0,
                      child: Image.asset('images/logo1.png'),
                    ),
                  ),
                  const SizedBox(
                    height: 48.0,
                  ),
                  TextField(
                    keyboardType: TextInputType.emailAddress,
                    textAlign: TextAlign.center,
                    onChanged: (value) {
                      email = value;
                    },
                    decoration: kTextFieldDecoration.copyWith(hintText: "Enter your email"),
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  TextField(
                    obscureText: true,
                    textAlign: TextAlign.center,
                    onChanged: (value) {
                      password = value;
                    },
                    decoration: kTextFieldDecoration.copyWith(hintText: "Enter your password"),
                  ),
                  const SizedBox(
                    height: 24.0,
                  ),
                   SubmitButton(color: Colors.lightBlueAccent, buttonName: "Log In", submit: () async{
                     setState(() {
                       spinner = true;
                     });
                     try{
                       final user = await _auth.signInWithEmailAndPassword(email: email!, password: password!);
                       if(user !=null) {
                         Navigator.pushNamed(context, ChatScreen.idChatScreen);

                       }
                     }catch (e)  {
                       print(e);
                     }
                     setState(() {
                       spinner = false;
                     });

                   },),
                ],
              ),
            ),
        ),
      );
  }
}
