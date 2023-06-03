class ProductsCategory{
  final int id;
  final String category;
  final String image;

  ProductsCategory({required this.id,
  required this.category,required this.image});
}

class Product{
  final int id;
  final String category;
  final String description;
  final String image;

  Product({required this.id,
  required this.description,
  required this.category,required this.image});
}

class UserCart{
  final String id;
  final String products;

  UserCart({required this.id,required this.products});
}


class ProductsCategoryAll{
  final int id;
  final String title;
  final String image;
  final dynamic price;
  final String description;
  final dynamic category;

  ProductsCategoryAll({
    required this.description,
    required this.category,
    required this.id,
  required this.title,required this.image,
  required this.price});
}


