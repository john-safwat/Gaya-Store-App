import 'FeedBack.dart';

class ProductDetails {
  ProductDetails({
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
  List<FeedBack>? feedBack;
  List<String>? images;


}