import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:qr_code/widgets/authform.dart';
enum AuthType {login, register}

class AuthScreen extends StatelessWidget {
  final AuthType authType;
  const AuthScreen({Key? key, required this.authType}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              children: < Widget > [
                Container(
                  height: MediaQuery
                      .of(context)
                      .size
                      .height * 0.5,
                  decoration: BoxDecoration(
                    color: Colors.lightBlue,
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(50),
                      bottomLeft: Radius.circular(50),
                    ),
                  ),
                ),
              Center(
                child: Column(
             children:<Widget> [
               SizedBox(height: 50),
                 Text(
                   'HELLO!',
                   style: TextStyle(
                       color: Colors.white,
                       fontSize: 28,
                   fontWeight: FontWeight.w800,
                     letterSpacing: 1.2,
                   ),
                 ),
               Image.asset(
                   'assets/image/logo2.png',height: 280
               ),
                  Authform(authType: authType),
             ],
           ),
              ),
            ],
           ),
              ],
            ),
        ),
      );
  }
}


