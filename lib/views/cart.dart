import 'package:flutter/material.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {

  //    @override
  // void initState() {
  //   WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
  //     Provider.of<CategoryProvider>(context,listen: false).getCart();
  //   });
  //   super.initState();
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
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
      body: Padding(
        padding: const EdgeInsets.only(top: 35,left: 15,right: 15),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: 6,
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
                            child: Center(child: Image.asset("assets/images/cloth.png")),
                          ),
                          title: const Text("Henley Shirts",
                          style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400,color: Colors.grey ),
                          ),
                          subtitle: const Text(r"$145",style: TextStyle(
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
                                const Text("1"),
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
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Subtotal :",
                  style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400),),
                  Text(r"$750",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),)
                ],
              ),
              const SizedBox(height: 15,),
              ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xffF67952),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                fixedSize: Size(253,55)
                ),
                onPressed: (){}, child: const  Text("Checkout",
                  style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),)
                ),
                const SizedBox(height:10)
          ],
        )
      ),
    );
  }
}