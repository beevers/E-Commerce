import "package:flutter/material.dart";

class ErrMes{
  static final messengerKey = GlobalKey<ScaffoldMessengerState>();
  static showSnackBar(String? text,{color =Colors.red}){
    if(text == null) return ;
    final snackBar = SnackBar(content: Text(text),backgroundColor: color,);
    messengerKey.currentState!..
    removeCurrentSnackBar()..
    showSnackBar(snackBar);
  }
}