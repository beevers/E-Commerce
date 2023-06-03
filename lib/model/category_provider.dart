import 'package:e_commerce/custom.dart';
import 'package:e_commerce/model/product_limited.dart';
import 'package:e_commerce/services/e_commerce_service.dart';
import 'package:flutter/material.dart';

class CategoryProvider extends ChangeNotifier{
  final ProductsService _service = ProductsService();
  bool isLoading = false;
  List<ProductsCategory> _categories = [];
  List<ProductsCategory> get categories => _categories;
  bool _isTrue = false;
  bool get isTrue => _isTrue;

  int _pageIndex = 0;
  int get pageIndex => _pageIndex;

  List<ProductsCategoryAll> _products = [];
  List<ProductsCategoryAll> get products => _products;

  List<ProductsCategoryAll> _catproduct = [];
  List<ProductsCategoryAll> get catproduct => _catproduct;

   dynamic _product = {};
  dynamic get product => _product;

  void invert(){
    _isTrue = !_isTrue;
    notifyListeners();
  }

  void equateIndex(index){
    _pageIndex = index;
    notifyListeners();
  }

  // void decreaseIndex(){
  //   _pageIndex--;
  //   notifyListeners();
  // }

 void openSheet(context,index){
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
                        child: Text(product.isEmpty ? "" :catproduct[index].title,
                        style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
                      ),
                      Text(product.isEmpty ? "" : r"$"+"${catproduct[index].price.toString()}",
                        style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),)
                    ],
                  ),
                  SizedBox(height: 16.53,),
                  Text(product.isEmpty ? "" :catproduct[index].description,style: TextStyle(fontSize: 12),)
                  ,SizedBox(height: 109.46,)
                    ,ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xffF67952),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                    fixedSize: Size(253,55)
                    ),
                    onPressed: (){
                      ErrMes.showSnackBar("Added to cart",color: Colors.green);
                    }, child: const  Text("Add to Cart",
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
  // ignore: prefer_final_fields
  dynamic _cartDetail = {};
  dynamic get cartDetail => _cartDetail;

  Map _detail = {};
  Map get detail => _detail;

  String? _token ; 
  String? get token => _token;

  
  Future<void> getCart () async {
   isLoading = true;
    notifyListeners();
    final response = await _service.getCart();
    _cartDetail = response;
    isLoading = false;
    notifyListeners(); 
  }

  Future<void> get6() async {
    isLoading = true;
    notifyListeners();
    final response = await _service.getFew();
    _categories = response;
    isLoading = false;
    notifyListeners();
  }

  Future<void> getProduct(index)async {
    final response = await _service.getProduct(index);
    _product = response;
     notifyListeners();
  }

   Future<void> getCatProduct(category)async {
    isLoading = true;
    notifyListeners();
    final response = await _service.getProductCat(category);
    _catproduct = response;
    isLoading = false;
    notifyListeners();
  }

  Future<void> getAllProducts()async {
    isLoading = true;
    notifyListeners();
    final response = await _service.getAll();
    _products = response;
    isLoading = false;
    notifyListeners();
  }

  Future<void> getUserDetail()async {
    isLoading = true;
    notifyListeners();
    final response = await _service.getUser();
    _detail = response;
    isLoading = false;
    notifyListeners();
  }

  Future<void> loginUser(String username, String password)async {
    isLoading = true;
    notifyListeners();
    final response = await _service.signIn(username,password);
    _token = response;
    notifyListeners();
    isLoading = false;
    notifyListeners();
  }

  // Future<void> addUser(String username, String password, String email)async {
  //   isLoading = true;
  //   notifyListeners();
  //   final response = await _service.signUp(username,password,email);
  //   _token = response;
  //   notifyListeners();
  //   isLoading = false;
  //   notifyListeners();
  // }
  
}