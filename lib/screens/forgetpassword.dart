import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AppForgetPassword extends StatefulWidget {
  const AppForgetPassword({Key? key}) : super(key: key);

  @override
  State<AppForgetPassword> createState() => _AppForgetPasswordState();
}

class _AppForgetPasswordState extends State<AppForgetPassword> {
  final _resetpassKey = GlobalKey<FormState>();
  final TextEditingController _resetPass = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.orange),
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: SafeArea(
        child: Form(
          key: _resetpassKey,
          child: ListView(
            children: [
              SizedBox(
                height: 100,
              ),
              SizedBox(
                height: 300,
                child: Image.asset('assets/Forgot_password.png'),
              ),
              Text('Receive an email to reset you password',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey,fontSize: 25.0),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextFormField(
                  validator: (username) {
                    if(username!.isEmpty){
                      return'Enter Your Email';
                    }
                    return null;
                  },
                  controller: _resetPass,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.mail,color: Colors.grey,),
                    hintText: 'Username',
                    labelText: 'Username',
                    labelStyle: const TextStyle(color: Colors.orange),
                    contentPadding: const EdgeInsets.symmetric(vertical: 20,horizontal: 10),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20,left: 20),
                child: SizedBox(
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    onPressed: () {
                      if(_resetpassKey.currentState!.validate()){
                        FirebaseAuth.instance
                            .sendPasswordResetEmail(email: _resetPass.text)
                            .then((value) => Navigator.of(context).pop());
                      }
                    },
                    child: Text('Forget Password',style: TextStyle(fontSize: 18.0),),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
