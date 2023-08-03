class PaymentException implements Exception{
  String errorMessage;
  PaymentException(this.errorMessage);
}