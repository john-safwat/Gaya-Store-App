import 'package:ecommerce/Data/Models/Order/OrderProductsDTO.dart';

class OrderProducts {
  OrderProducts({
      this.id, 
      this.quantity, 
      this.orderTotal,});

  int? id;
  int? quantity;
  double? orderTotal;

  OrderProductsDTO toData(){
    return OrderProductsDTO(
      orderTotal: orderTotal,
      quantity: quantity,
      id: id
    );
  }
}