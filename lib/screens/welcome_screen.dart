import 'package:chat_cat_application/screens/registre_screen.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import '../components/submit_button.dart';
import 'login_screen.dart';

class WelcomeScreen extends StatefulWidget {
  static const String idWelcomeScreen = "welcomeScreen";

  const WelcomeScreen({super.key});
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    animation =
        ColorTween(begin: Colors.cyan, end: Colors.white).animate(controller);
    controller.forward();

    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: SizedBox(
                    height: controller.value * 1.5 * 65,
                    child: Image.asset('images/logo1.png'),
                  ),
                ),
                TypewriterAnimatedTextKit(
                  text: const [' Cat Chat'],
                  textStyle: const TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54),
                ),
              ],
            ),
            const SizedBox(
              height: 48.0,
            ),
            SubmitButton(
              color: Colors.lightBlueAccent,
              buttonName: "Log In",
              submit: () {
                Navigator.pushNamed(context, LoginScreen.idLoginScreen);
              },
            ),
            SubmitButton(
                color: Colors.blue,
                buttonName: "Register",
                submit: () {
                  Navigator.pushNamed(
                      context, RegistrationScreen.idRegisterScreen);
                }),
          ],
        ),
      ),
    );
  }
}
