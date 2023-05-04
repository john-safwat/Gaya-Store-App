class OrderProductsDTO {
  OrderProductsDTO({
      this.id, 
      this.quantity, 
      this.orderTotal,});

  OrderProductsDTO.fromJson(dynamic json) {
    id = json['id'];
    quantity = json['quantity'];
    orderTotal = json['orderTotal'];
  }
  int? id;
  int? quantity;
  double? orderTotal;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['quantity'] = quantity;
    map['orderTotal'] = orderTotal;
    return map;
  }

}