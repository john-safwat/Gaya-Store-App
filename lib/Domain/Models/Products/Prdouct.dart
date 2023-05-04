class Product {
  Product({
    this.id,
    this.name,
    this.category,
    this.price,
    this.mainImage,
    this.brand,
    this.rating,this.isInWishList = false});

  num? id;
  String? name;
  String? category;
  num? price;
  String? mainImage;
  String? brand;
  num? rating;
  bool? isInWishList;

}