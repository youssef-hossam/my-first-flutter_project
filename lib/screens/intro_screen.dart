import 'package:flutter/material.dart';
import 'package:qr_code/widgets/orginal_button.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    backgroundColor: Colors.black,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              SizedBox(),
              Image.asset('assets/image/logo.png'),
             OriginalButton(text: 'Get Started',
               onpressed: ()=> Navigator.of(context).pushNamed('login'),
               textColor: Colors.green,
               bgColor: Colors.white10,
             ),
            ],
          ),
        ),
      ),
    );
  }
}
