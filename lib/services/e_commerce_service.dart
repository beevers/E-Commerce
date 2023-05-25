import 'dart:convert';
import 'package:e_commerce/custom.dart';
import 'package:e_commerce/model/product_limited.dart';
import 'package:http/http.dart' as http;


class ProductsService{
  Future<List<ProductsCategory>> getFew() async {
    const uri = "https://fakestoreapi.com/products?limit=6";
    final url = Uri.parse(uri);
    final response = await http.get(url);
    if(response.statusCode == 200){
      final json = jsonDecode(response.body) as List;
      final categoriesDetails = json.map((categoriesInfo) {
        return ProductsCategory(
          id: categoriesInfo["id"],
           category: categoriesInfo["category"] ,
            image: categoriesInfo["image"]);
      } ).toList();
      return categoriesDetails;
    }
    return [];
  }

  //  Future<Map<String,dynamic>> getSingle(url) async {
  //   const uri = "https://fakestoreapi.com/products/$url";
  //   final url = Uri.parse(uri);
  //   final response = await http.get(url);
  //   if(response.statusCode == 200){
  //     final json = jsonDecode(response.body) as Map;
  //     final categoriesDetails = {
  //       'id' : json["id"],
  //       'category' :json["category"],
  //       'price' : json["price"]

  //     };
  //     return categoriesDetails;
  //   }
  //   return {};
  // }

  Future<List<ProductsCategoryAll>> getAll() async {
    const uri = 'https://fakestoreapi.com/products?sort=desc';
    final url = Uri.parse(uri);
    final response = await http.get(url);
    if(response.statusCode == 200){
      final json = jsonDecode(response.body) as List;
      final categoriesDetails = json.map((categoriesInfo) {
        return ProductsCategoryAll(
          id: categoriesInfo["id"],
           title: categoriesInfo["title"] ,
            image: categoriesInfo["image"],
            price: categoriesInfo["price"],
            description : categoriesInfo["description"]
            );
      } ).toList();
      return categoriesDetails;
    }
    return [];
  }

  //   Future<Map<String, dynamic>> getCart() async {
  //     String id =  "id" ;
  //     String products = "products";
  //   const uri = 'https://fakestoreapi.com/carts/5';
  //   final url = Uri.parse(uri);
  //   final response = await http.get(url);
  //   if(response.statusCode == 200){
  //     final json = jsonDecode(response.body) as Map<String,dynamic>;
  //     return {
  //       id: json["id"],
  //        products: json["products"]};
  //   }
  //   throw {};
  // }
  
  Future signIn(String username, String password) async {
    const uri = "https://fakestoreapi.com/auth/login";
    final url = Uri.parse(uri);
    try{
       final response = await http.post(
      url,
      body: {
        "username" : username,
        "password" : password
      }
    );
    if(response.statusCode == 200){
      Map data = jsonDecode(response.body.toString());
      return data["token"];
    }
    else{ 
      return "";
    }
    }
    catch(e){
      print(e.toString());
    }
  }

  Future getUser() async {
    const uri = 'https://fakestoreapi.com/users/1';
    final url = Uri.parse(uri);
    final response = await http.get(url);
    if(response.statusCode == 200){
    int id = 0 ;
   String name = "name";
   String email = "email";
    dynamic username = "username";
   String city = "city";
    String phone = "phone";
    String zip = "zip";
    String street = "street";
      final Map<String,dynamic> json = jsonDecode(response.body);
      final userDetails = {
        name: json["name"]!["firstname"] +" "+ json["name"]!["lastname"],
        id: json["id"],
        email: json['email'],
        username: json['username'],
         city: json["address"]['city'],
         zip: json["address"]["zipcode"],
         phone : json["phone"],
         street : json["address"]["street"]
      };
         return userDetails;
    }
    return [];
  }
}
