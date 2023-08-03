import 'package:ecommerce/Data/Models/Payment/Request/OrderRegestration/OrderRegestrationRequestDTO.dart';

import 'Items.dart';

class OrderRegistrationRequest {
  OrderRegistrationRequest({
      this.authToken, 
      this.deliveryNeeded, 
      this.amountCents, 
      this.currency, 
      this.merchantOrderId, 
      this.items,});

  String? authToken;
  String? deliveryNeeded;
  String? amountCents;
  String? currency;
  String? merchantOrderId;
  List<Items>? items;

  OrderRegistrationRequestDTO toDataSource(){
    return OrderRegistrationRequestDTO(
      amountCents: amountCents,
      authToken: authToken,
      currency: currency,
      deliveryNeeded: deliveryNeeded,
      merchantOrderId: merchantOrderId,
      items: items?.map((e) => e.toDataSource()).toList(),
    );
  }

}