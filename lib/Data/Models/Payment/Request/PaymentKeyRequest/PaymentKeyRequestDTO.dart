import 'BillingDataDTO.dart';

class PaymentKeyRequestDTO {
  PaymentKeyRequestDTO({
      this.authToken, 
      this.amountCents, 
      this.expiration, 
      this.orderId, 
      this.billingData, 
      this.currency, 
      this.integrationId, });

  PaymentKeyRequestDTO.fromJson(dynamic json) {
    authToken = json['auth_token'];
    amountCents = json['amount_cents'];
    expiration = json['expiration'];
    orderId = json['order_id'];
    billingData = json['billing_data'] != null ? BillingDataDTO.fromJson(json['billing_data']) : null;
    currency = json['currency'];
    integrationId = json['integration_id'];
  }
  String? authToken;
  String? amountCents;
  num? expiration;
  String? orderId;
  BillingDataDTO? billingData;
  String? currency;
  num? integrationId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['auth_token'] = authToken;
    map['amount_cents'] = amountCents;
    map['expiration'] = expiration;
    map['order_id'] = orderId;
    if (billingData != null) {
      map['billing_data'] = billingData?.toJson();
    }
    map['currency'] = currency;
    map['integration_id'] = integrationId;
    return map;
  }

}