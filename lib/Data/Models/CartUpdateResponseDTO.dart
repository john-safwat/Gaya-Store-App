import 'CartItemDTO.dart';

class CartUpdateResponseDTO {
  CartUpdateResponseDTO({
      this.code, 
      this.message, 
      this.cartItem,});

  CartUpdateResponseDTO.fromJson(dynamic json) {
    code = json['code'];
    message = json['message'];
    cartItem = json['cartItem'] != null ? CartItemDTO.fromJson(json['cartItem']) : null;
  }
  int? code;
  String? message;
  CartItemDTO? cartItem;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['code'] = code;
    map['message'] = message;
    if (cartItem != null) {
      map['cartItem'] = cartItem?.toJson();
    }
    return map;
  }

}