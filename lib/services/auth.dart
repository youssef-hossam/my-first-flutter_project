import 'package:firebase_auth/firebase_auth.dart';

class User {
final String uid;
User(
    {required this.uid}
    );
}


class AuthBase {



  User _userFromFirebase(FirebaseUser){
    var user = FirebaseUser;
    print(user.uid);
    return User(uid: user.uid);
  }


  Future registerWithEmailAndpassword(String email,String password) async{
    print("Email is :" + email);
    print("Password is :" + password);
   final authResult = await  FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
   return _userFromFirebase((authResult.user));
  }



  Future<User>loginWithEmailAndpassword(String email,String password) async{
    print("Email is :" + email);
    print("Password is :" + password);
    final authResult = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
    return _userFromFirebase(authResult.user);
  }




  Future<void> logout() async{
    await FirebaseAuth.instance.signOut();
  }

  }
  //Kareem Adel