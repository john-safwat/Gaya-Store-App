class CartProduct {
  CartProduct({
      this.id, 
      this.name, 
      this.category, 
      this.price, 
      this.mainImage, 
      this.brand, 
      this.quantity, 
      this.rating,this.orderedQuantity = 1});

  num? id;
  String? name;
  num? category;
  num? price;
  String? mainImage;
  num? brand;
  num? quantity;
  num? rating;
  int? orderedQuantity;

}