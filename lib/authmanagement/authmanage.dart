import 'package:firebase_auth/firebase_auth.dart';

class AuthManage{
  Future SignUp(String userEmail , String userPass)async{
    await FirebaseAuth.instance.createUserWithEmailAndPassword(email: userEmail, password: userPass);
  }
}