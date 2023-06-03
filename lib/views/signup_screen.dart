import 'package:e_commerce/custom.dart';
import 'package:e_commerce/model/button_provider.dart';
import 'package:e_commerce/model/category_provider.dart';
import 'package:e_commerce/views/onboard_screen.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
 void nextScreen(){
     Navigator.push(context, MaterialPageRoute(builder: (
    (context) => ChangeNotifierProvider<AuthenticationProvider>(
      create: (_) => AuthenticationProvider(),
      child: const HomePage())
      )));
  }
  void popError(){
     ErrMes.showSnackBar("Incorrect Password or Username");
     Navigator.pop(context);
  }
    final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final usernameControllerS = context.select<AuthenticationProvider,TextEditingController>((type) => type.nameControllerSignUp);
    final emailControllerS = context.select<AuthenticationProvider,TextEditingController>((type) => type.emailControllerSignUp);
    final passwordControllerS = context.select<AuthenticationProvider,TextEditingController>((type) => type.passwordControllerSignUp);
    bool isTicked = context.select<AuthenticationProvider,bool>((valueType) => valueType.isTicked);
    return  Scaffold(
      resizeToAvoidBottomInset : false,
      body:SafeArea(
        child: Consumer<CategoryProvider>(
          builder: (context,value,child) {
            return Padding(
              padding: EdgeInsets.only(top: height/11.4,right: width/19,left: width/19),
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
                     const SizedBox(height: 28,),
                     const Text("Sign Up",style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 22,
                      fontFamily: "Roboto"
                     ),),
                     const SizedBox(height: 25,),
                     TextFormField(
                      validator : (value) => value!.isEmpty ?
                        "Name can't be empty" :null ,
                      controller: usernameControllerS,
                        cursorColor: const Color(0xffF67952),
                        decoration: InputDecoration(
                          hintText: "Name",
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
                     const SizedBox(height: 10.5,),
                     TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (email) => 
                      email != null && EmailValidator.validate(email) ? 
                       null : "Enter a valid Email",
                        controller: emailControllerS,
                        cursorColor: const Color(0xffF67952),
                        decoration: InputDecoration(
                          hintText: "Email",
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
                              child: Icon(color:Colors.orangeAccent[400],Icons.mail),
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
                     const SizedBox(height: 11,),
                     TextFormField(
                        validator : (value) => value!.isEmpty && value.length < 8 ?
                        "Pasword Empty or too Short" : null,
                        controller: passwordControllerS,
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
                      Padding(
                       padding: EdgeInsets.only(right:height/9.4),
                       child: Row(
                         children: [
                          Transform.scale(
                            scale : 0.8,
                            child: SizedBox(
                              width: height/27.2,
                              child: Checkbox(
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                                fillColor: MaterialStateProperty.all(const Color(0xffF67952)),
                                value: isTicked,
                                 onChanged: (value){
                                  context.read<AuthenticationProvider>().tick();
                                 }),
                            ),
                          ),
                           RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                            text: "I accept all the ",
                            style:  TextStyle(
                              fontFamily: "Roboto",
                              fontWeight: FontWeight.w400,
                              color: Colors.grey.shade400,fontSize: 14),
                            children: <TextSpan>[
                              TextSpan(
                                text: 'Terms & condition',
                               style: const TextStyle(
                                fontWeight: FontWeight.w400,
                                fontFamily: "Roboto",
                                fontSize: 12,
                                color: Color(0xff230A06),
                               ),
                               recognizer: TapGestureRecognizer()
                                  ..onTap = (){
                                  }
                               ),
                            ],
                      ),
                    ),
                         ],
                       ),
                     ),
                     const SizedBox(height: 13  ,),
                     ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xffF67952),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                        fixedSize: Size(height/4, height/14)
                      ),
                      onPressed: isTicked ? 
                      ()async {
                        FocusScope.of(context).unfocus();
                            if(!formKey.currentState!.validate())return ;
                            showDialog(context: context,
                             builder: (context){return const Center(child: CircularProgressIndicator(),);});
                            await value.loginUser("david_r",
                             r"3478*#54");
                            value.token == "Incorrect" ? popError() : nextScreen()
                            ; 
                      } 
                      : null, child: const  Text("Sign Up")),
                     const SizedBox(height: 30,),
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
                           padding: EdgeInsets.only(bottom:height/37.6,right: height/13,left: height/13),
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
                        text: "Already have an account? ",
                        style:  TextStyle(
                          fontFamily: "Roboto",
                          fontWeight: FontWeight.w400,
                          color: Colors.grey.shade400,fontSize: 14),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Log in',
                           style: const TextStyle(
                            fontFamily: "Roboto",
                            fontSize: 14,
                            color: Color(0xff230A06),
                           ),
                           recognizer: TapGestureRecognizer()
                              ..onTap = (){
                               Navigator.pop(context);
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
        )),
    );
  }
}
