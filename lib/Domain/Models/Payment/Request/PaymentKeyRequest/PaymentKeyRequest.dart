import 'package:ecommerce/Data/Models/Payment/Request/PaymentKeyRequest/PaymentKeyRequestDTO.dart';

import 'BillingData.dart';

class PaymentKeyRequest {
  PaymentKeyRequest({
      this.authToken, 
      this.amountCents, 
      this.expiration, 
      this.orderId, 
      this.billingData, 
      this.currency, 
      this.integrationId, 
      this.lockOrderWhenPaid,});

  String? authToken;
  String? amountCents;
  num? expiration;
  String? orderId;
  BillingData? billingData;
  String? currency;
  num? integrationId;
  String? lockOrderWhenPaid;

  PaymentKeyRequestDTO toDomain(){
    return PaymentKeyRequestDTO(
      authToken : authToken,
      amountCents : amountCents,
      expiration : expiration,
      orderId : orderId,
      billingData : billingData!.toDomain(),
      currency : currency,
      integrationId : integrationId,
    );
  }

}