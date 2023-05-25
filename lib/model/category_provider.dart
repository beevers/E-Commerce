import 'package:e_commerce/model/product_limited.dart';
import 'package:e_commerce/services/e_commerce_service.dart';
import 'package:flutter/material.dart';

class CategoryProvider extends ChangeNotifier{
  final ProductsService _service = ProductsService();
  bool isLoading = false;
  List<ProductsCategory> _categories = [];
  List<ProductsCategory> get categories => _categories;

  List<ProductsCategoryAll> _products = [];
  List<ProductsCategoryAll> get products => _products;

  // ignore: prefer_final_fields
  // Map _cartDetail = {};
  // Map get cartDetail => _cartDetail;

  Map _detail = {};
  Map get detail => _detail;

  String? _token = ""; 
  String? get token => _token;

  
  // Future<void> getCart () async {
  //  isLoading = true;
  //   notifyListeners();
  //   final response = await _service.getCart();
  //   _cartDetail = response;
  //   isLoading = false;
  //   notifyListeners(); 
  // }

  Future<void> get6() async {
    isLoading = true;
    notifyListeners();
    final response = await _service.getFew();
    _categories = response;
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
    final response = await _service.signIn(username,password);
    _token = response;
    notifyListeners();
  }
}