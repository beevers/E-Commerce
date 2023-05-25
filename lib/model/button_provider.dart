import 'package:flutter/material.dart';

class AuthenticationProvider extends ChangeNotifier{
  bool _isTicked = false;
  int _index = 0;


  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  final _emailControllerSignUp = TextEditingController();
  final _passwordControllerSignUp = TextEditingController();
  final _nameControllerSignUp = TextEditingController();

  //To get the email of the user use _currentUser.email!
  TextEditingController get emailController => _emailController;
  TextEditingController get passwordController => _passwordController;

  TextEditingController get nameControllerSignUp => _nameControllerSignUp;
  TextEditingController get emailControllerSignUp => _emailControllerSignUp;
  TextEditingController get passwordControllerSignUp => _passwordControllerSignUp;

 
  bool get isTicked => _isTicked;

  int get index => _index;



  tick(){
    _isTicked = !_isTicked;
    notifyListeners();
  }

  equate(newIndex){
    _index = newIndex;
    notifyListeners();
  }


}