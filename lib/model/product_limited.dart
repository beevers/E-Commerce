class ProductsCategory{
  final int id;
  final String category;
  final String image;

  ProductsCategory({required this.id,
  required this.category,required this.image});
}

class ProductsCategoryAll{
  final int id;
  final String title;
  final String image;
  final dynamic price;
  final String description;

  ProductsCategoryAll({
    required this.description,
    required this.id,
  required this.title,required this.image,
  required this.price});
}
