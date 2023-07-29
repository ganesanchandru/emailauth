import 'package:firebase_auth/firebase_auth.dart';

class AuthManage{
  Future<UserCredential> signUp(String userEmail , String userPass)async{
    return await FirebaseAuth.instance.createUserWithEmailAndPassword(email: userEmail, password: userPass);
  }
}