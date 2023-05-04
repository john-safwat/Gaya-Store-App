import 'package:ecommerce/Domain/Models/Cart/CartProduct.dart';

class CartProductDTO {
  CartProductDTO({
      this.id, 
      this.name, 
      this.category, 
      this.price, 
      this.mainImage, 
      this.brand, 
      this.quantity, 
      this.rating,});

  CartProductDTO.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    category = json['category'];
    price = json['price'];
    mainImage = json['mainImage'];
    brand = json['brand'];
    quantity = json['quantity'];
    rating = json['rating'];
  }
  num? id;
  String? name;
  num? category;
  num? price;
  String? mainImage;
  num? brand;
  num? quantity;
  num? rating;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['category'] = category;
    map['price'] = price;
    map['mainImage'] = mainImage;
    map['brand'] = brand;
    map['quantity'] = quantity;
    map['rating'] = rating;
    return map;
  }

  CartProduct toDomain(){
    return CartProduct(
      id: id,
      quantity: quantity,
      rating: rating,
      price: price,
      mainImage: mainImage,
      category: category,
      brand: brand,
      name: name
    );
  }
}