import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:grad_project/screens/ask_for_age.dart';
import 'package:grad_project/screens/ask_for_name.dart';
import 'package:grad_project/screens/forget_password.dart';
import 'package:grad_project/screens/sign_in.dart';
import 'package:grad_project/screens/sign_up.dart';
import 'package:sizer/sizer.dart';
///test commit
import 'home_feature/arabic_intro_screen.dart';
import 'home_feature/arabic_screen.dart';
import 'home_feature/arabic_unit_screen.dart';
import 'home_feature/subjects_screen.dart';
import 'screens/onboarding_screen.dart';
import 'screens/set_new_password.dart';
Future<void> main()  async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType)  {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          routes: {
            // 'LoginScreen' : (context)=> const LoginScreen(),
            // 'RegisterScreen' : (context)=> const RegisterScreen(),
            // 'ForgetPassword' : (context)=> const ForgetPassword(),
            // 'SetNewPassword' : (context)=> const SetNewPassword(),
            'AskForName' : (context)=> const AskForName(),
            'AskForAge' : (context)=> const AskForAge(),
            'SubjectsScreen' : (context)=>  const SubjectsScreen(),
            'ArabicScreen' : (context)=>  const ArabicScreen(),
            'ArabicIntroScreen' : (context)=>   ArabicIntroScreen(),
            'ArabicUnitScreen' : (context)=>   ArabicUnitScreen(),
          },
          home: AnimatedSplashScreen(
            duration: 3000,
            nextScreen: const OnboardingScreen(),
            splash: Image.asset(
              'assets/images/splash1.jpg',
              fit: BoxFit.fill,
            ),
            splashTransition: SplashTransition.scaleTransition,centered: true,animationDuration: const Duration(seconds: 2),
            splashIconSize: double.infinity,
          ),
        );
      },
    );
  }
}


