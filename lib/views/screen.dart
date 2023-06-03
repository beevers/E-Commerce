import 'package:e_commerce/model/category_provider.dart';
import 'package:e_commerce/model/product_limited.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Fun extends StatefulWidget {
  final index;
  final category;
  const Fun({super.key,required this.index,required this.category});

  @override
  State<Fun> createState() => _FunState();
}

class _FunState extends State<Fun> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      
      Provider.of<CategoryProvider>(
      context,listen: false).getCatProduct(widget.category);
      Provider.of<CategoryProvider>(
      context,listen: false).getProduct(widget.index + 1);
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    bool isTrue = context.select<CategoryProvider,bool>((value) => value.isTrue);
    int pageIndex = context.select<CategoryProvider,int>(
       (value) => value.pageIndex);
    final height = MediaQuery.of(context).size.height;
    final catProduct = context.select<CategoryProvider,List<ProductsCategoryAll>>(
       (value) => value.catproduct);
      
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
            onPressed: (){
              
              // context.read<CategoryProvider>().invert();
            },
             icon:  Icon(Icons.favorite
             ,color: isTrue ? Colors.red : Colors.grey
             ))
        ],
      ) ,
      body: Padding(
        padding: const EdgeInsets.only(bottom: 20,left: 10,right: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: SizedBox(
                    
                    width: height/2,
                    height: height/2.2,
                    child: PageView.builder(
                      onPageChanged: (index){
                        context.read<CategoryProvider>().equateIndex(index);
                      },
                      itemCount: catProduct.length,
                      itemBuilder: (context,index){
                        return catProduct.isEmpty ? const Center(child: CircularProgressIndicator(
                         color: Color(0xffF67952) ,
                        ),) :
                        Image.network(catProduct[index].image);
                      }),
                  ),
                ),
              ],
            ),
            AnimatedSmoothIndicator(  
           activeIndex: pageIndex,  
                count: catProduct.length,  
                effect: const SlideEffect(  
                paintStyle:  PaintingStyle.stroke,  
                dotColor:  Colors.grey,  
                activeDotColor:  Color(0xffF67952) 
            ),   
              ) , 
              ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xffF67952),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                fixedSize: const Size(253,55)
                ),
                onPressed: (){
                    context.read<CategoryProvider>().openSheet(context,pageIndex);
                }, child: const  Text("Checkout",
                  style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),)
                ),
          ],
        ),
      ),
    );
  }
}
