import 'package:e_commerce/model/button_provider.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final resetEmail = Provider.of<AuthenticationProvider>(context).emailController;
    // final resetEmail = context.select<
    // AuthenticationProvider,TextEditingController>((type) => type.resetEmail);
    final formKeyReset = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Reset Password",style: TextStyle(fontSize: 20,color: Colors.black),),
        leading: IconButton(
          color: Colors.black,
          onPressed: (){
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios_new_outlined)),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 10,right: 10,bottom: 30),
          child: Form(
            key: formKeyReset,
            child: Column(
              children: [
                const Text("Receive an Email to Reset Your Password",
                style: TextStyle(fontSize: 25,color: Colors.grey),),
                const SizedBox(height: 40,),
               TextFormField(
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            validator: (email) => 
                            email != null && EmailValidator.validate(email) ? 
                             null :  "Enter a valid Email",
                            controller: resetEmail,
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
                              fillColor: const Color(0xffFFFFFF),
                              focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: const BorderSide(
                                color: Color(0xffFFFFFF),
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: const BorderSide(
                                color: Color(0xffFFFFFF),
                                width: 2.0,
                              ),
                            ),
                            )
                           ),
                           const Spacer(),
                            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xffF67952),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                  fixedSize: const Size(253,55)
                  ),
                  onPressed: (){
                    if(!formKeyReset.currentState!.validate()) return;
                     showDialog(context: context,
                         builder: (context) => const Center(
                          child: CircularProgressIndicator(),
                         ));
                      //  context.read<AuthenticationProvider>().resetPassword(resetEmail.text.trim());
                       Navigator.pop(context);
                  }, child: const  Text("Reset Password",
                    style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),)
                  ),
                           
            ]),
          ),
        ),
      ),
    );
  }
}