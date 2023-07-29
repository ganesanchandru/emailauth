import 'package:fire_base/authmanagement/authmanage.dart';
import 'package:fire_base/screens/homepage.dart';
import 'package:fire_base/screens/signin.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppSignUP extends StatefulWidget {
  const AppSignUP({Key? key}) : super(key: key);

  @override
  State<AppSignUP> createState() => _AppSignUPState();
}

class _AppSignUPState extends State<AppSignUP> {
  bool _textVisible = true;
  final _sinUpFormKey = GlobalKey<FormState>();
  final TextEditingController _userName = TextEditingController();
  final TextEditingController _userMobile = TextEditingController();
  final TextEditingController _userPass = TextEditingController();
  final TextEditingController _userConfirm = TextEditingController();
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
          key: _sinUpFormKey,
          child: ListView(
            children: [
              SizedBox(
                height: 200,
                child: Image.asset('assets/signup.png'),
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
                  controller: _userName,
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
                padding: const EdgeInsets.only(left: 20,right: 20,bottom: 10),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  maxLength: 10,
                  validator: (userMob) {
                    if(userMob!.isEmpty){
                      return'Please Enter 10 Digit Number';
                    }
                    return null;
                  },
                  controller: _userMobile,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.phone_android,color: Colors.grey,),
                    hintText: 'Moile Number',
                    labelText: 'Mobile Number',
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
                padding: const EdgeInsets.only(left: 20,right: 20,bottom: 10),
                child: TextFormField(
                  obscureText: _textVisible,
                  keyboardType: TextInputType.text,
                  // maxLength: 6,
                  validator: (userpass) {
                    if(userpass!.isEmpty){
                      return'Please Enter 6 Digit Password';
                    }
                    return null;
                  },
                  controller: _userPass,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.password,color: Colors.grey,),
                    suffixIcon: IconButton(onPressed: () {
                      setState(() {
                        _textVisible = !_textVisible;
                      });
                    }, icon: _textVisible ? Icon(Icons.visibility,color: Colors.grey,) : Icon(Icons.visibility_off,color: Colors.grey,)),
                    hintText: 'Password',
                    labelText: 'Password',
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
                padding: const EdgeInsets.only(left: 20,right: 20,bottom: 10),
                child: TextFormField(
                  obscureText: _textVisible,
                  keyboardType: TextInputType.text,
                  // maxLength: 6,
                  validator: (userpass) {
                    if(userpass!.isEmpty ){
                      return'Please Enter 6 Digit Password';
                    }
                    return null;
                  },
                  controller: _userConfirm,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.password,color: Colors.grey,),
                    suffixIcon: IconButton(onPressed: () {
                      setState(() {
                        _textVisible = !_textVisible;
                      });
                    }, icon: _textVisible ? Icon(Icons.visibility,color: Colors.grey,) : Icon(Icons.visibility_off,color: Colors.grey,)),
                    hintText: 'Confirm Password',
                    labelText: 'Confirm Password',
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
                      if(_sinUpFormKey.currentState!.validate()){
                        AuthManage().SignUp(_userName.text.trim(), _userPass.text.trim());
                        print('Validated');
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const HomePage()),
                        );
                      }else{
                        print('Not validated');
                      }
                    },
                    child: Text('Sign Up',style: TextStyle(fontSize: 18.0),),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Already having account ?',style: TextStyle(color: Colors.blue),),
                  TextButton(onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const AppSignINScreen()),
                    );
                  }, child: Text('Sign In',style: TextStyle(color: Colors.orange),))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
