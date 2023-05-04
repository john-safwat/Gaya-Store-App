class OrderResponse {
  OrderResponse({
      this.statusCode, 
      this.message, 
      this.orderNumber, 
      this.userName, 
      this.total, 
      this.shippingCharge,});


  int? statusCode;
  String? message;
  int? orderNumber;
  String? userName;
  int? total;
  int? shippingCharge;


}