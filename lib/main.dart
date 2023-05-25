import "dart:convert";

import "package:e_commerce/model/category_provider.dart";
import "package:e_commerce/views/splash_screen.dart";
import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:provider/provider.dart";
import "package:http/http.dart" as http;
import "custom.dart";

final navigatorKey = GlobalKey<NavigatorState>();
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized(); 
  SystemChrome.setPreferredOrientations;
   SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((value) => runApp(
     MaterialApp(
      scaffoldMessengerKey: ErrMes.messengerKey ,
      navigatorKey: navigatorKey,
      theme: ThemeData(
        progressIndicatorTheme: const ProgressIndicatorThemeData(
          color:  Color(0xffF67952)
        ),
        appBarTheme: const AppBarTheme(
          elevation: 0.0,
          backgroundColor:  Color(0xffE5E5E5)
        ),
        scaffoldBackgroundColor: const Color(0xffE5E5E5)
      ),
      debugShowCheckedModeBanner: false,
      home: ChangeNotifierProvider<CategoryProvider>(
        create: (_) => CategoryProvider(),
        child: const SplashScreen()
        ))));
      // ChangeNotifierProvider(
      //   create: (_) => CategoryProvider(),
      //   child: const Test())

}

// class Test extends StatefulWidget {
//   const Test({super.key});

//   @override
//   State<Test> createState() => _TestState();
// }

// class _TestState extends State<Test> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//           ElevatedButton(
//             onPressed: (){
//               signIn("johnd", r"m38rmF$");
//             },
//              child: Text("Click"))
//         ]),
//       ),
//     );

//   }
//    Future signIn(String email, String password) async {
//     const uri = "https://fakestoreapi.com/auth/login";
//     final url = Uri.parse(uri);
//     try{
//        final response = await http.post(
//       url,
//       body: {
//         "username" : email,
//         "password" : password
//       }
//     );
//     if(response.statusCode == 200){
//       Map data = jsonDecode(response.body.toString());
//       print("suceessful");
//       return data["token"];
//     }
//     else{
//       print("error");
//       return "";
//     //  ErrMes.showSnackBar("Incorrect Password or username");
//     }
//     }
//     catch(e){
//       print(e.toString());
//     }
//   }
// }