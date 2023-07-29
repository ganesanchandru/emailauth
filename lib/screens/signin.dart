import 'package:fire_base/screens/homepage.dart';
import 'package:fire_base/screens/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'forgetpassword.dart';

class AppSignINScreen extends StatefulWidget {
  const AppSignINScreen({Key? key}) : super(key: key);

  @override
  State<AppSignINScreen> createState() => _AppSignINScreenState();
}

class _AppSignINScreenState extends State<AppSignINScreen> {
  bool _textVisible = true;
  final _sinInFormKey = GlobalKey<FormState>();
  TextEditingController _userEmailController = TextEditingController();
  TextEditingController _userPassController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _sinInFormKey,
          child: ListView(
            children: [
              SizedBox(height:
              300.0,
                child: Image.asset('assets/singin.png'),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text('Sign In',
                  style: TextStyle(
                    fontSize: 25.0,color: Colors.grey
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextFormField(
                  validator: (userEmail) {
                    if(userEmail!.isEmpty){
                      return'Enter Your Email';
                    }else if(!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                        .hasMatch(userEmail)) {
                      return "It's Not a vaild Email";
                    }
                    return null;
                  },
                  controller: _userEmailController,
                  cursorColor: Colors.orange,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    labelText: "Email",
                    labelStyle: TextStyle(color: Colors.orange),
                    hintText: "Enter your Email Address",
                    prefixIcon: Icon(Icons.person,
                      color: Colors.grey,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: BorderSide(color: Colors.grey,
                    )
                  ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: BorderSide(color: Colors.grey,
                    ),

                ),
              ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextFormField(
                  validator: (userpass) {
                    if(userpass!.isEmpty){
                      return'Enter Your Password';
                    }
                    return null;
                  },
                  controller: _userPassController,
                  obscureText: _textVisible,
                  cursorColor: Colors.orange,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    labelText: "Password",
                    labelStyle: TextStyle(color: Colors.orange),
                    hintText: "Enter your Password",
                    prefixIcon: Icon(Icons.password,
                      color: Colors.grey,
                    ),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _textVisible = !_textVisible;
                        });
                      },
                      icon: _textVisible ? Icon(Icons.visibility,color: Colors.grey,) : Icon(Icons.visibility_off,color: Colors.grey,),
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide: BorderSide(color: Colors.grey,
                        )
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: BorderSide(color: Colors.grey,
                      ),

                    ),
                  ),
                ),
              ),
              
              Padding(
                padding: const EdgeInsets.only(top: 10,right: 20,left: 20,bottom: 10),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                    onPressed: () {
                    if(_sinInFormKey.currentState!.validate()){
                      FirebaseAuth.instance.signInWithEmailAndPassword(email: _userEmailController.text, password: _userPassController.text)
                          .then((value) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const HomePage()),
                        );
                      }).onError((error, stackTrace) {
                        print("Error ${error.toString()}");
                      });
                    }
                    },
                    child: Text('Login',style: TextStyle(fontSize: 18.0),),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20,left: 20),
                child: Row(mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const AppForgetPassword()),
                      );
                    }, child: Text('Forget Password')),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('New User ?'),
                  TextButton(onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const AppSignUP()),
                    );
                  }, child: Text('Sign Up',style: TextStyle(color: Colors.orange),))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
///