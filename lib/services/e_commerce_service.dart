import 'dart:convert';
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

  Future<Map<String,dynamic>> getProduct(index) async {
    final uri = "https://fakestoreapi.com/products/$index";
    final url = Uri.parse(uri);
    final response = await http.get(url);
    if(response.statusCode == 200){
      final json = jsonDecode(response.body) as Map<String, dynamic>;
      final productDetail = {
        "id" : json["id"],
        "image" : json["image"],
        "title" : json["title"],
        "description" : json["description"],
        "price" : json["price"]
      };
      //print(productDetail);
      return productDetail;
    }
    else{
      print("empty");
      return {};
    }
  }

  Future getCart() async {
    const uri = "https://fakestoreapi.com/carts/5";
     final url = Uri.parse(uri);
     final response = await http.get(url);
     if(response.statusCode == 200){
      final json = jsonDecode(response.body) as Map;
      final cartDetail = {
         "id": json["id"],
         "products": json["products"]
      };
      return cartDetail;
     }
     print("empty");
     return {};
  }

  Future<List<ProductsCategoryAll>> getAll() async {
    const uri = 'https://fakestoreapi.com/products?sort=desc';
    final url = Uri.parse(uri);
    final response = await http.get(url);
    if(response.statusCode == 200){
      final json = jsonDecode(response.body) as List;
      final categoriesDetails = json.map((categoriesInfo) {
        return ProductsCategoryAll(
          category: categoriesInfo["categories"],
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
    Future<List<ProductsCategoryAll>> getProductCat(category) async {
    final uri = 'https://fakestoreapi.com/products/category/$category';
    final url = Uri.parse(uri);
    final response = await http.get(url);
    if(response.statusCode == 200){
      final json = jsonDecode(response.body) as List;
      final categoriesDetails = json.map((categoriesInfo) {
        return ProductsCategoryAll(
          category: categoriesInfo["category"],
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
      // print(data["token"]);
      print("sucessful");
      return data["token"];
    }
    else{ 
      print("Incorrect");
      return "Incorrect";
    }
    }
    catch(e){
      print(e.toString());
    }
  }

  // Future signUp(String username, String password) async {
  //   const uri = "https://fakestoreapi.com/auth/login";
  //   final url = Uri.parse(uri);
  //   try{
  //      final response = await http.post(
  //     url,
  //     body: {
  //       "username" : user,
  //       "password" : r"m38rmF$"
  //     }
  //   );
  //   if(response.statusCode == 200){
  //     Map data = jsonDecode(response.body.toString());
  //     // print(data["token"]);
  //     print("sucessful");
  //     return data["token"];
  //   }
  //   else{ 
  //     print("Incorrect");
  //     return "Incorrect";
  //   }
  //   }
  //   catch(e){
  //     print(e.toString());
  //   }
  // }

  Future getUser() async {
    const uri = 'https://fakestoreapi.com/users/1';
    final url = Uri.parse(uri);
    try{
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
    catch(e){
      return [];
    }
  }

  
}

