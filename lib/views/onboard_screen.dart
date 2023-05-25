import "package:e_commerce/model/category_provider.dart";
import "package:e_commerce/views/cart.dart";
import "package:e_commerce/views/home_screen.dart";
import "package:e_commerce/views/profile_screen.dart";
import "package:flutter/material.dart";
import "package:provider/provider.dart";

import "../model/button_provider.dart";

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<bool> onWillPop() async {
    return false;
  }

  final itemList = [
    MenuItem(Icons.home,"Home"),
    MenuItem(Icons.shopping_cart_outlined,"Cart"),
    MenuItem(Icons.favorite_outline,"Favourite"),
    MenuItem(Icons.person_outline_rounded,"Profile"),
  ];

  final  _body =const [HomeScreen(),Cart(),Material(),Profile()];
  @override
  Widget build(BuildContext context) {
    int index = context.select<AuthenticationProvider,int>((value) => value.index);
    return WillPopScope(
      onWillPop: onWillPop,
      child: Scaffold(
        resizeToAvoidBottomInset : false,
       
        body: ChangeNotifierProvider(
          create: (_) => CategoryProvider(),
          child: IndexedStack(
            index: index,
            children: _body,
          ),
        ),
        bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(
          canvasColor: const Color(0xffE5E5E5),
          primaryColor: Colors.red),
          child:  BottomNavigationBar( //index == 0 ?
            showSelectedLabels: false,
            showUnselectedLabels: false,
            backgroundColor:  const Color(0xffE5E5E5),
            unselectedItemColor: Colors.grey,
            selectedItemColor: const Color(0xffF67952),
            elevation: 0.0,
            type: BottomNavigationBarType.fixed,
            currentIndex: index,
            onTap: (newIndex){
              
              context.read<AuthenticationProvider>().equate(newIndex);
            },
            items: itemList.map((e) => BottomNavigationBarItem(
              label:e.label ,
              icon: Icon(e.icon))).toList()), //: Container(),
        ),
      ),
    );
  }
}

class MenuItem{
  final IconData icon;
  final String label;
  MenuItem(this.icon,this.label);

}