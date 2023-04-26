import 'package:ecommerce/Domain/Models/Prdouct.dart';

class ProductsDTO {
  ProductsDTO({
      this.id, 
      this.name, 
      this.category, 
      this.price, 
      this.mainImage, 
      this.brand, 
      this.rating,});

  ProductsDTO.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    category = json['category'];
    price = json['price'];
    mainImage = json['mainImage'];
    brand = json['brand'];
    rating = json['rating'];
  }
  num? id;
  String? name;
  String? category;
  num? price;
  String? mainImage;
  String? brand;
  num? rating;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['category'] = category;
    map['price'] = price;
    map['mainImage'] = mainImage;
    map['brand'] = brand;
    map['rating'] = rating;
    return map;
  }

  Product toDomain(){
    return Product(
      rating: rating,
      price: price,
      mainImage: mainImage,
      category: category,
      brand: brand,
      name: name,
      id: id
    );
  }

}