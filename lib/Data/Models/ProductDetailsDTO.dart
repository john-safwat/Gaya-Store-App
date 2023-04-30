import 'package:ecommerce/Domain/Models/ProductDetails.dart';

import 'FeedBackDTO.dart';

class ProductDetailsDTO {
  ProductDetailsDTO({
      this.id, 
      this.name, 
      this.category, 
      this.price, 
      this.mainImage, 
      this.description, 
      this.descriptionImage, 
      this.brand, 
      this.quantity, 
      this.rating, 
      this.userRating, 
      this.userComment, 
      this.feedBack, 
      this.images,});

  ProductDetailsDTO.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    category = json['category'];
    price = json['price'];
    mainImage = json['mainImage'];
    description = json['description'];
    descriptionImage = json['descriptionImage'];
    brand = json['brand'];
    quantity = json['quantity'];
    rating = json['rating'];
    userRating = json['userRating'];
    userComment = json['userComment'];
    if (json['feedBack'] != null) {
      feedBack = [];
      json['feedBack'].forEach((v) {
        feedBack?.add(FeedBackDTO.fromJson(v));
      });
    }
    images = json['images'] != null ? json['images'].cast<String>() : [];
  }
  num? id;
  String? name;
  String? category;
  num? price;
  String? mainImage;
  String? description;
  String? descriptionImage;
  String? brand;
  num? quantity;
  num? rating;
  num? userRating;
  String? userComment;
  List<FeedBackDTO>? feedBack;
  List<String>? images;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['category'] = category;
    map['price'] = price;
    map['mainImage'] = mainImage;
    map['description'] = description;
    map['descriptionImage'] = descriptionImage;
    map['brand'] = brand;
    map['quantity'] = quantity;
    map['rating'] = rating;
    map['userRating'] = userRating;
    map['userComment'] = userComment;
    if (feedBack != null) {
      map['feedBack'] = feedBack?.map((v) => v.toJson()).toList();
    }
    map['images'] = images;
    return map;
  }

  ProductDetails toDomain(){
    return ProductDetails(
      name: name,
      id: id,
      brand: brand,
      category: category,
      mainImage: mainImage,
      price: price,
      rating: rating,
      description: description,
      descriptionImage: descriptionImage,
      feedBack: feedBack?.map((e) => e.toDomain()).toList(),
      quantity: quantity,
      userComment: userComment,
      userRating: userRating,
      images: images
    );
  }
}