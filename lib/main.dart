import 'package:chat_cat_application/screens/chat_screen.dart';
import 'package:chat_cat_application/screens/login_screen.dart';
import 'package:chat_cat_application/screens/registre_screen.dart';
import 'package:chat_cat_application/screens/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const CatChat());
}

class CatChat extends StatelessWidget {
   const CatChat({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: WelcomeScreen.idWelcomeScreen,
      routes: {
        WelcomeScreen.idWelcomeScreen : (context)=> const WelcomeScreen(),
        RegistrationScreen.idRegisterScreen : (context)=> const RegistrationScreen(),
        LoginScreen.idLoginScreen : (context) => const LoginScreen(),
        ChatScreen.idChatScreen : (context)=> const ChatScreen(),
      },
    );
  }
}
