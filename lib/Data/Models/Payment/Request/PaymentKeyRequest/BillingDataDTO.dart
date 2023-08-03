class BillingDataDTO {
  BillingDataDTO({
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

  BillingDataDTO.fromJson(dynamic json) {
    apartment = json['apartment'];
    email = json['email'];
    floor = json['floor'];
    firstName = json['first_name'];
    street = json['street'];
    building = json['building'];
    phoneNumber = json['phone_number'];
    shippingMethod = json['shipping_method'];
    postalCode = json['postal_code'];
    city = json['city'];
    country = json['country'];
    lastName = json['last_name'];
    state = json['state'];
  }
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

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['apartment'] = apartment;
    map['email'] = email;
    map['floor'] = floor;
    map['first_name'] = firstName;
    map['street'] = street;
    map['building'] = building;
    map['phone_number'] = phoneNumber;
    map['shipping_method'] = shippingMethod;
    map['postal_code'] = postalCode;
    map['city'] = city;
    map['country'] = country;
    map['last_name'] = lastName;
    map['state'] = state;
    return map;
  }

}