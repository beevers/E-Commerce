import 'dart:convert';

import 'package:e_commerce/custom.dart';
import 'package:e_commerce/model/button_provider.dart';
import 'package:e_commerce/model/category_provider.dart';
import 'package:e_commerce/views/onboard_screen.dart';
import 'package:e_commerce/views/signup_screen.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;



class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  String token = "";
   final formKey = GlobalKey<FormState>();
    Future signIn(String username, String password) async {
    const uri = "https://fakestoreapi.com/auth/login";
    final url = Uri.parse(uri);
    try{
       final response = await http.post(
      url,
      body: {
        "username" : username,
        "password" : password
      }
    );
    if(response.statusCode == 200){
      Map data = jsonDecode(response.body.toString());
      token = data["token"];
    }
    else{
      token = "";
    }
    }
    catch(e){
      print(e.toString());
    }
  }
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final usernameController = context.select<AuthenticationProvider,TextEditingController>((contType)=> contType.emailController);
    final passwordController = context.select<AuthenticationProvider,TextEditingController>((contType)=> contType.passwordController); 
   
    return Scaffold(
      resizeToAvoidBottomInset : false,
      body:SafeArea(
        child: Consumer<CategoryProvider>(
          builder: (context,value,child) {
            return Padding(
                  padding: EdgeInsets.only(top:80,right: width/19,left: width/19),
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [ 
                        const SizedBox(
                          width: 54,
                          height: 62,
                           child: Image(
                              image: AssetImage(
                                "assets/images/login_logo.png"
                              ),
                            ),
                         ),
                         const SizedBox(height: 32,),
                         const Text("Log in",style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 22,
                          fontFamily: "Roboto"
                         ),),
                         const SizedBox(height: 33,),
                         TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (username) => 
                          username != null ? 
                         null : "Username can't be empty" ,
                          controller: usernameController,
                          cursorColor: const Color(0xffF67952),
                          decoration: InputDecoration(
                            hintText: "Username",
                                hintStyle: const TextStyle(
                                  fontSize: 12,fontWeight: FontWeight.w400
                                ),
                            prefixIcon: Padding(
                              padding: const EdgeInsets.only(left: 5,right: 6),
                              child: Container(
                                decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.deepOrange[100],
                                ),
                                width: 48,
                                height: 45,
                                child: Icon(color:Colors.orangeAccent[400],Icons.person),
                              ),
                            ),
                            filled: true,
                            fillColor: Colors.white60,
                            focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(
                              color: Colors.white60,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(
                              color: Colors.white60,
                              width: 2.0,
                            ),
                          ),
                          )
                         ),
                         const SizedBox(height: 16,),
                         TextFormField(
                          validator: (value) => value!.isEmpty ? "Enter Password" : null ,
                          controller : passwordController,
                          cursorColor: const Color(0xffF67952),
                          decoration: InputDecoration(
                            hintText: "Password",
                                hintStyle: const TextStyle(
                                  fontSize: 12,fontWeight: FontWeight.w400
                                ),
                            prefixIcon: Padding(
                              padding: const EdgeInsets.only(left: 5,right: 6),
                              child: Container(
                                decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.deepOrange[100],
                                ),
                                width: 48,
                                height: 45,
                                child: Icon(color:Colors.orangeAccent[400],Icons.lock),
                              ),
                            ),
                            filled: true,
                            fillColor:Colors.white60,
                            focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(
                              color: Colors.white60,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(
                              color: Colors.white60,
                              width: 2.0,
                            ),
                          ),
                          )
                         ),
                         const SizedBox(height: 16,),
                          Padding(
                           padding: EdgeInsets.only(left: height/3.2),
                           child: GestureDetector(
                            onTap: null,
                             child: const Text("Forgot password?",
                             style: TextStyle(
                              color: Color(0xFF230A06),
                              fontSize: 12,
                              fontFamily: "Roboto"),),
                           ),
                         ),
                         const SizedBox(height: 18,),
                         ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xffF67952),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                            fixedSize: Size(height/4, height/14)
                          ),
                          onPressed: () async {
                            FocusScope.of(context).unfocus();
                            if(!formKey.currentState!.validate())return ;
                            await signIn(usernameController.text.trim(), passwordController.text.trim());
                            token == "" ? ErrMes.showSnackBar("Incorrect Password or Username"):
                            Navigator.push(context, MaterialPageRoute(builder: (
                              (context) => ChangeNotifierProvider<AuthenticationProvider>(
                                create: (_) => AuthenticationProvider(),
                                child: const HomePage())
                                ))) ; 
                          },
                           child: const  Text("Log in")),
                         const SizedBox(height: 44,),
                         Padding(
                           padding:  EdgeInsets.only(left: height/11.2,right: height/11.2),
                           child:const  Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                            Expanded(
                              flex: 2,
                              child: Divider()),
                            SizedBox(width: 19.8,),
                            Text("Or",style: TextStyle(fontFamily: "Roboto"),),
                            SizedBox(width:18.8),
                            Expanded(
                              flex: 2,
                              child: Divider()),
                           ],),
                         ),
                         const SizedBox(height: 9.6,),
                         Padding(
                           padding: EdgeInsets.only(bottom: height/15,right: height/9,left: height/9),
                           child:  Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                             Container(
                                decoration: BoxDecoration(
                                color: Colors.white70,
                                  borderRadius: BorderRadius.circular(50)
                                ),
                                width: 71, // Adjust the width and height according to your requirements
                                height: 71, // Placeholder color for the container
                                child: Center(
                                  child: FractionallySizedBox(
                                    widthFactor: 0.5, // Adjust the width factor to control the size of the image
                                    heightFactor: 0.5, // Adjust the height factor to control the size of the image
                                    child: Image.asset('assets/images/fb.png'), // Replace with your actual image path
                                  ),
                                ),
                              ),
                                SizedBox(width: 35,),
                               Container(
                                decoration: BoxDecoration(
                                color: Colors.white70,
                                  borderRadius: BorderRadius.circular(50)
                                ),
                                width: 71, // Adjust the width and height according to your requirements
                                height: 71, // Placeholder color for the container
                                child: Center(
                                  child: FractionallySizedBox(
                                    widthFactor: 0.4, // Adjust the width factor to control the size of the image
                                    heightFactor: 0.4, // Adjust the height factor to control the size of the image
                                    child: Image.asset('assets/images/google.png'), // Replace with your actual image path
                                  ),
                                ),
                              ),
                            ],
                           ),
                         ),
                         RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            text: "Don't have an account? ",
                            style:  TextStyle(
                              fontFamily: "Roboto",
                              fontWeight: FontWeight.w400,
                              color: Colors.grey.shade400,fontSize: 14),
                            children: <TextSpan>[
                              TextSpan(
                                text: 'Sign Up',
                               style: const TextStyle(
                                fontFamily: "Roboto",
                                fontSize: 14,
                                color: Color(0xff230A06),
                               ),
                               recognizer: TapGestureRecognizer()
                                  ..onTap = (){
                                    Navigator.push(context, MaterialPageRoute(
                                      builder: (context) {return ChangeNotifierProvider(
                                        create: (context) => AuthenticationProvider(),
                                        child: const SignUpScreen()); }));
                                  }
                               ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
          }
        )
          ),
    );
    
  }
  
}