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
  final TextEditingController _userEmailController = TextEditingController();
  final TextEditingController _userMobileController = TextEditingController();
  final TextEditingController _userPassController = TextEditingController();
  final TextEditingController _userConfirmController = TextEditingController();
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
                  validator: (userEmail) {
                    if(userEmail!.isEmpty){
                      return'Please Enter Your Email';
                    }else if(!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                        .hasMatch(userEmail)) {
                      return "It's Not a vaild Email";
                    }
                    return null;
                  },
                  controller: _userEmailController,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.mail,color: Colors.grey,),
                    hintText: 'Email',
                    labelText: 'Email',
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
                      return'Please Enter Phone Number';
                    } else if(userMob.length < 10){
                      return'Please Enter 10 Digit Number';
                    }
                    return null;
                  },
                  controller: _userMobileController,
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
                      return'Please Enter Your Password';
                    }else if(userpass.length < 6){
                      return 'Password is minimum 6 character';
                    }
                    return null;
                  },
                  controller: _userPassController,
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
                  validator: (comfirmpass) {
                    if(comfirmpass!.isEmpty ){
                      return'Please Enter Your Password';
                    }else if(comfirmpass != _userPassController.text.trim()){
                      return 'Wrong Password';
                    }
                      return null;
                  },
                  controller: _userConfirmController,
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
                        AuthManage().signUp(_userEmailController.text.trim(), _userPassController.text.trim()).then((value) => {
                        Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const HomePage()),
                        ),
                        }).catchError((error) {
                          print(error);
                        });
                        print('Validated');
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
