import 'package:e_commerce/model/button_provider.dart';
import 'package:e_commerce/model/category_provider.dart';
import 'package:e_commerce/views/onboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {

     @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<CategoryProvider>(context,listen: false).getCart();
      Provider.of<CategoryProvider>(context,listen: false).getProduct(3);
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: (){
              Navigator.pushReplacement(context, MaterialPageRoute(builder: ((context) =>MultiProvider(
                providers: [
                  ChangeNotifierProvider(create: (_) => CategoryProvider()),
                  ChangeNotifierProvider(create: (_) => AuthenticationProvider())
                ],
                child: const HomePage()))));
            },
            icon: const Icon(
              color: Colors.black,
              Icons.arrow_back_ios_new),
          ),
          centerTitle: true,
          title: const Text("My Cart",
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,fontWeight: FontWeight.w500),),
        ) ,
        body: Consumer<CategoryProvider>(
          builder: (context,value,child) {
            final cartDetail =value.cartDetail;
            print(cartDetail.length);
            return Padding(
              padding: const EdgeInsets.only(top: 35,left: 15,right: 15),
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: cartDetail.length,
                      itemBuilder: (context, index){
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 13,),
                          child: Card(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                            color: Colors.grey[100],
                            child: Padding(
                              padding: const EdgeInsets.only(top: 8,bottom: 11),
                              child: ListTile(
                                leading: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.red[50],
                                    borderRadius: BorderRadius.circular(10)
                                  ),
                                  width: 84,
                                  height: 73,
                                  child: Center(child:value.products.isEmpty ? CircularProgressIndicator() : Image.network(value.products[index].image) ),
                                ),
                                title:  Text("Henley Shirts ${value.products[index].title}",
                                style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400,color: Colors.grey ),
                                ),
                                subtitle: Text(value.products[index].price.toString(),style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,fontWeight: FontWeight.w500),),
                                  trailing: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween ,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Container(
                                        width: 26,
                                        height: 22,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(7),
                                          color: Colors.red[50]
                                        ),
                                        child: const Center(child: Text("+")),
                                      ),
                                      const SizedBox(width: 10.76,),
                                      Text(cartDetail["products"][index]["quantity"] .toString()),
                                      const SizedBox(width: 10.76,),
                                      Container(
                                        width: 26,
                                        height: 22,
                                        decoration: BoxDecoration(
                                          color: Colors.red[50]
                                        ),
                                        child: const Center(child: Text("-")),
                                      ),
                                    ],
                                  ),
                              ),
                            ),
                          ),
                        );
                      }),
                  ),
                  const SizedBox(height: 20,),
                     Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Subtotal :",
                        style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400),),
                        Text(value.products.isNotEmpty ? (value.products[0].price +value.products[1].price).toString() : "" ,style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),)
                      ],
                    ),
                    const SizedBox(height: 15,),
                    ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xffF67952),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                      fixedSize: const Size(253,55)
                      ),
                      onPressed: (){
                        
                      }, child: const  Text("Checkout",
                        style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),)
                      ),
                      const SizedBox(height:10)
                ],
              )
            );
          }
        ),
      ),
    );
  }
}