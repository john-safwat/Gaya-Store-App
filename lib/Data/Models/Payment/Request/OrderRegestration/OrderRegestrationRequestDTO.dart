import 'ItemsDTO.dart';

class OrderRegistrationRequestDTO {
  OrderRegistrationRequestDTO({
      this.authToken, 
      this.deliveryNeeded, 
      this.amountCents, 
      this.currency,
      this.merchantOrderId,
      this.items,});

  OrderRegistrationRequestDTO.fromJson(dynamic json) {
    authToken = json['auth_token'];
    deliveryNeeded = json['delivery_needed'];
    amountCents = json['amount_cents'];
    currency = json['currency'];
    merchantOrderId = json['merchant_order_id'];
    if (json['items'] != null) {
      items = [];
      json['items'].forEach((v) {
        items?.add(ItemsDTO.fromJson(v));
      });
    }
  }
  String? authToken;
  String? deliveryNeeded;
  String? amountCents;
  String? currency;
  String? merchantOrderId;
  List<ItemsDTO>? items ;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['auth_token'] = authToken;
    map['delivery_needed'] = deliveryNeeded;
    map['amount_cents'] = amountCents;
    map['currency'] = currency;
    map['merchant_order_id'] = merchantOrderId;
    if (items != null) {
      map['items'] = items?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}