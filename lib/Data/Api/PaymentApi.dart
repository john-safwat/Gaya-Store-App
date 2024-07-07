import 'dart:convert';

import 'package:ecommerce/Data/Models/Payment/Request/OrderRegestration/OrderRegestrationRequestDTO.dart';
import 'package:ecommerce/Data/Models/Payment/Request/PaymentKeyRequest/PaymentKeyRequestDTO.dart';
import 'package:http/http.dart' as http;

class PaymentApi {

  static PaymentApi? _instance;
  PaymentApi._();

  static PaymentApi getPaymentApi(){
    _instance??=PaymentApi._();
    return _instance!;
  }

  String baseUrl = 'accept.paymob.com';
  String authenticationRequestURL = "/api/auth/tokens";
  String orderRegistrationAPIURL = "/api/ecommerce/orders";
  String paymentKeyRequestURL = "/api/acceptance/payment_keys";

  Future<String> authRequest() async {
    Uri url = Uri.https(baseUrl , authenticationRequestURL);
    var response = await http.post(
        url,
        headers: {
          "Content-Type": "application/json"
        },
        body: jsonEncode({'api_key': 'ZXlKaGJHY2lPaUpJVXpVeE1pSXNJblI1Y0NJNklrcFhWQ0o5LmV5SmpiR0Z6Y3lJNklrMWxjbU5vWVc1MElpd2ljSEp2Wm1sc1pWOXdheUk2T0RZNE9ETTBMQ0p1WVcxbElqb2lhVzVwZEdsaGJDSjkuSjRoY2FxOFZ6MDRkVzNLQjdLb2MtOVNkcnNkNnhTREY4eC0zeHNiR25NU0JOSkpvWURRZTU1QWFVSVQ5aGx6R3lhWHRMWENldnZVUlBGaEY3aHZLUWc='})
    );
    Map<String , dynamic> data = jsonDecode(response.body);
    return data['token'];
  }

  Future<String> orderRegistrationRequest(OrderRegistrationRequestDTO orderRegistrationRequest)async{
    Uri url = Uri.https(baseUrl , orderRegistrationAPIURL);
    var response = await http.post(
      url,
      headers: {
        "Content-Type": "application/json"
      },
      body: jsonEncode(orderRegistrationRequest),
    );
    return jsonDecode(response.body)['id'].toString();
  }

  Future<String> paymentKeyRequest(PaymentKeyRequestDTO paymentKeyRequestDTO)async{
    Uri url = Uri.https(baseUrl , paymentKeyRequestURL);
    var response =  await http.post(
      url,
      headers: {
        "Content-Type": "application/json",
      },
      body: jsonEncode(paymentKeyRequestDTO.toJson()),
    );
    return jsonDecode(response.body)['token'];
  }

}
