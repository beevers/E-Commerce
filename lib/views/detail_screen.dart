import 'package:e_commerce/model/product_limited.dart';
import 'package:flutter/material.dart';

class Detail extends StatefulWidget {
  final ProductsCategoryAll info;
  const Detail({super.key, required this.info});

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  @override
  Widget build(BuildContext context) {
    // final products = context.select<CategoryProvider,List<ProductsCategoryAll>>(
    //   (value) => value.products);
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: const  Icon(Icons.arrow_back_ios_new
          ,color: Colors.black,          ),
        ),
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: (){},
             icon:  Icon(Icons.favorite
             ,color: Colors.red[300],
             ))
             //Use an if statement
        ],
      ) ,
      body: Padding(
        padding: EdgeInsets.only(bottom: height/43,right: height/16,left: height/16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: height/2,
              height: height/2.2,
               child: Image.network(widget.info.image)
            ),
            ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xffF67952),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
              fixedSize: const Size(253,55)
              ),
              onPressed: openSheet, child: const  Text("Checkout",
                style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),)
              ),
             
          ],
        ),
      )
    );
  }
  void openSheet(){
    showModalBottomSheet(
      isScrollControlled: true,
    shape: const OutlineInputBorder(
    borderSide: BorderSide.none,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),topRight: Radius.circular(20))
    ),
      context: context,
      builder: (context) {
        return Wrap(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 21,right: 19,top: 30),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 200,
                        child: Text(widget.info.title,
                        style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
                      ),
                      Text(r"$"+"${widget.info.price.toString()}",
                        style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),)
                    ],
                  ),
                  SizedBox(height: 16.53,),
                  Text(widget.info.description,style: TextStyle(fontSize: 12),)
                  ,SizedBox(height: 109.46,)
                    ,ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xffF67952),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                    fixedSize: Size(253,55)
                    ),
                    onPressed: (){}, child: const  Text("Add to Cart",
                      style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),)
                    ),
                              const SizedBox(height: 20,)
                ],
              ),
            ),
          ],
        );
      });
  }
}