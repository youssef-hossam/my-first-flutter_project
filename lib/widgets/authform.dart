import 'package:flutter/material.dart';
import 'package:qr_code/services/auth.dart';
import '../screens/auth_screen.dart';
import 'orginal_button.dart';

class Authform extends StatefulWidget {
 final AuthType authType;
  const Authform({Key? key,required this.authType}) : super(key: key);
  @override
  State<Authform> createState() => _AuthformState();
}
class _AuthformState extends State<Authform> {
  final _formkey = GlobalKey<FormState>();
  String _email = '', _password ='';
  AuthBase authBase = AuthBase();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formkey,
      child: Padding(
      padding: const EdgeInsets.symmetric(horizontal:40),

     child: Column(
        children:<Widget> [
          SizedBox(height: 16),
          TextFormField(
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter Email';
                }else{
                  _email = value;
                }
                return null;
              },
            decoration: InputDecoration(
              labelText: 'Enter your email',
              hintText: 'ex:test@gmail.com'),
          ),
          SizedBox(height: 12),
          TextFormField(
              validator: (String? value) {
                if (value == null || value.length < 6) {
                  return 'Password Must Be Greater Then 6';
                }else{
                  _password = value;
                }
                return null;
              },
            decoration: InputDecoration(
              labelText: 'Enter your passowrd'
            ),
         obscureText: true,
          ),
        SizedBox(height: 20),
        OriginalButton(text: widget.authType ==AuthType.login ?'login':'register',
            onpressed:()async{
          if (_formkey.currentState!.validate()){
           if(widget.authType==AuthType.login) {
             await  authBase.loginWithEmailAndpassword(_email, _password);
             Navigator.of(context).pushReplacementNamed('scanner');
           } else {
             await authBase.registerWithEmailAndpassword(_email, _password);
             Navigator.of(context).pushReplacementNamed('scanner');
           }
          }
            } ,
            textColor: Colors.white,
            bgColor: Colors.lightBlue
        ),
        SizedBox(height: 5),
        FlatButton(
          onPressed: () {
            if (widget.authType==AuthType.login)
              Navigator.of(context).pushReplacementNamed('register');
            else
              Navigator.of(context).pushReplacementNamed('login');
          },
          child: Text(
            widget.authType==AuthType.login
                ?'Don\'t have an account?'
                :'You have an account',
            style: TextStyle(
              color: Colors.black54,
              fontSize:18,
            ),
            ),
        ),
        ],
      ),
    ),
    );
  }
}
