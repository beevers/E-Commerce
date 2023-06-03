import "package:e_commerce/model/category_provider.dart";
import "package:e_commerce/views/splash_screen.dart";
import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:provider/provider.dart";
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
      home: ChangeNotifierProvider( 
        create: (_) =>  CategoryProvider(),
        child:  const SplashScreen()
        )
        )));

}
