import 'package:e_commerce/model/category_provider.dart';
import 'package:e_commerce/views/detail_screen.dart';
import 'package:e_commerce/views/screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/product_limited.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<CategoryProvider>(context,listen: false).get6();
      Provider.of<CategoryProvider>(context,listen: false).getAllProducts();
      Provider.of<CategoryProvider>(context,listen: false).getUserDetail();
    });
    super.initState();
  }
  
  
  final GlobalKey<ScaffoldState> _scaffoldKey =  GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    final categories = context.select<CategoryProvider,List<ProductsCategory>>(
      (value) => value.categories);
      final products = context.select<CategoryProvider,List<ProductsCategoryAll>>(
      (value) => value.products);
       final street = context.select<CategoryProvider,Map>(
      (value) => value.detail);
    final height = MediaQuery.of(context).size.height;
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
         drawer: const Drawer(),
         
        key: _scaffoldKey,
        resizeToAvoidBottomInset: false,
         appBar: AppBar(
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 8,top: 12),
                child: Container(
                  width: 42,
                  height: 20,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8)
                    ,color: Colors.grey[200],
                  ),
                  child: IconButton(
                    onPressed: (){
                    },
                    color:Colors.grey[500],icon : Icon(size: 25,Icons.notifications))),
              )
              ],
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.location_on_outlined,color: Colors.black,size: 14,),
                Text(street["street"] ?? "",style: const TextStyle(
                  color: Color(0xff000000),
                  fontSize: 14,fontWeight: FontWeight.w400),),
              ],
            ),
            centerTitle: true,
            leading: IconButton(
              onPressed: (){
                
                      _scaffoldKey.currentState!.openDrawer();
              },
              icon: const Icon(
                color : Color(0xff000000),
                Icons.sort),),
            elevation: 0,
            backgroundColor: const Color(0xffE5E5E5),
          ),
        body: Padding(
              padding:  EdgeInsets.only(left: height/42,top: 20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Explore",
                    style: TextStyle(fontSize: 32,fontWeight: FontWeight.w500),),
                    const SizedBox(height: 20,),
                    SizedBox(
                      width: 195,
                      child: Text("best Outfits for you",
                      style: TextStyle(
                        color: Colors.grey[400],
                        fontSize: 20,fontWeight: FontWeight.w400),),
                    ),
                    const SizedBox(height: 25.5,),
                     Padding(
                       padding: const EdgeInsets.only(right: 20),
                       child: TextFormField(
                            cursorColor: const Color(0xffF67952),
                            decoration: InputDecoration(
                              hintText: "Search Items...",
                              hintStyle: const TextStyle(
                                fontSize: 14,fontWeight: FontWeight.w400
                              ),
                              suffixIcon: Padding(
                                padding: const EdgeInsets.only(right: 6),
                                child: Container(
                                  decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.deepOrange[400],
                                  ),
                                  width: 48,
                                  height: 45,
                                  child: const Icon(color:Colors.white,Icons.tune),
                                ),
                              ),
                              prefixIcon:const Padding(
                                padding: EdgeInsets.only(left: 5,right: 6),
                                child: Icon(Icons.search_outlined,color: Colors.grey,),
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
                     ),
                     const SizedBox(height: 35,),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children:  List.generate(categories.length ,(index) {
                          return  Padding(
                          padding: const EdgeInsets.only(right: 17),
                          child: InkWell(
                            onTap: () async {
                             await Provider.of<CategoryProvider>(
                            context,listen: false).getCatProduct(categories[index].category);
                              Navigator.push(context, MaterialPageRoute(builder: (context){
                                  return ChangeNotifierProvider(
                                    create: (_) => CategoryProvider(),
                                    child:  Fun(index : index,category: categories[index].category,));
                                }));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white60 ,
                                borderRadius: BorderRadius.circular(10)
                              ),
                              width: 71,
                              height: 75,
                              child:  Padding(
                                padding: const EdgeInsets.only(top:11,bottom: 4),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      width: 39,
                                      height: 38,
                                      child: Image.network(categories[index].image)),
                                    SizedBox(
                                      width: 34,
                                      height : 17,
                                      child: Text(categories[index].category,
                                      style: const TextStyle(fontSize: 12,fontWeight: FontWeight.w500,color: Colors.grey),),
                                    )
                                  ],
                                ),
                              ),
                              ),
                          ),
                        );}),
                      ),
                    ),
                    const SizedBox(height: 40,),
                    const Padding(
                      padding: EdgeInsets.only(right: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                         Text("New Arrival",
                         style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),
                         ),
                         Text("See All",
                         style: TextStyle(
                          color: Colors.grey,
                          fontSize: 14,fontWeight: FontWeight.w400),
                         ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 28,),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(products.length, (index) => Padding(
                            padding: const EdgeInsets.only(right: 17),
                            child: InkWell(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context){
                                  return ChangeNotifierProvider(
                                    create: (_) => CategoryProvider(),
                                    child: Detail(info: products[index]));
                                }));
                              },
                              child: Container(
                                width: 154,
                                height: 190,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white54
                                ),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top:5),
                                      child: SizedBox(
                                        width: 142,
                                        height: 125,
                                        child: Image.network(products[index].image)),
                                    ),
                                     Padding(
                                      padding: const EdgeInsets.only(left: 7,right: 7,top: 7),
                                      child: SizedBox(
                                        width: 137,
                                        height: 40,
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                             SizedBox(
                                              width: 98.6,
                                              child: Text(products[index].title,
                                              style: const TextStyle(fontSize: 12,fontWeight: FontWeight.w400),),
                                            ),
                                            SizedBox(
                                              width: 30,
                                              child: Text(r"$"+"${products[index].price.toString()}", style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500),))
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ) ),
                      ),
                    )
                  ],
                ),
              ),
            ),
      ),
    );
  }
}