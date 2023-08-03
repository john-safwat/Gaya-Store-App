class ItemsDTO {
  ItemsDTO({
      this.id, 
      this.quantity, 
      this.orderTotal,});

  ItemsDTO.fromJson(dynamic json) {
    id = json['id'];
    quantity = json['quantity'];
    orderTotal = json['orderTotal'];
  }
  num? id;
  num? quantity;
  num? orderTotal;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['quantity'] = quantity;
    map['orderTotal'] = orderTotal;
    return map;
  }

}