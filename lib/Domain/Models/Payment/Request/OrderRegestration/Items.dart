import 'package:ecommerce/Data/Models/Payment/Request/OrderRegestration/ItemsDTO.dart';

class Items {
  Items({
      this.id, 
      this.quantity, 
      this.orderTotal,});

  num? id;
  num? quantity;
  num? orderTotal;

  ItemsDTO toDataSource(){
    return ItemsDTO(
        id : id,
        quantity : quantity,
        orderTotal : orderTotal,
    );
  }

}