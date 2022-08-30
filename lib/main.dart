import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qr_code/scanner.dart';
import 'package:qr_code/screens/auth_screen.dart';
import 'package:qr_code/screens/intro_screen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      inputDecorationTheme:InputDecorationTheme(
        filled: true,
        fillColor: Color(0xfff2f9fe),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.circular(25),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.circular(25),
        ),
        focusedBorder:  OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.circular(25),
        ),
      ) ,
      ),
      home:IntroScreen(),
      routes: {
        'intro': (context) => IntroScreen(),
        'login':(context) => AuthScreen(authType: AuthType.login),
        'register':(context) =>AuthScreen(authType: AuthType.register),
        'scanner':(context) => Scanner(),
      },
    );
  }
}







