import 'package:ecommerce/Data/Models/Payment/Request/PaymentKeyRequest/BillingDataDTO.dart';

class BillingData {
  BillingData({
      this.apartment, 
      this.email, 
      this.floor, 
      this.firstName, 
      this.street, 
      this.building, 
      this.phoneNumber, 
      this.shippingMethod, 
      this.postalCode, 
      this.city, 
      this.country, 
      this.lastName, 
      this.state,});

  String? apartment;
  String? email;
  String? floor;
  String? firstName;
  String? street;
  String? building;
  String? phoneNumber;
  String? shippingMethod;
  String? postalCode;
  String? city;
  String? country;
  String? lastName;
  String? state;

  BillingDataDTO toDomain(){
    return BillingDataDTO(
        apartment : apartment ,
        email : email ,
        floor : floor ,
        firstName : firstName ,
        street : street ,
        building : building ,
        phoneNumber : phoneNumber ,
        shippingMethod : shippingMethod ,
        postalCode : postalCode ,
        city : city ,
        country : country ,
        lastName : lastName ,
        state : state ,
    );
  }

}