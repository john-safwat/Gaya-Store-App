import 'package:ecommerce/Domain/Models/FeedBack.dart';

class FeedBackDTO {
  FeedBackDTO({
      this.user, 
      this.rate, 
      this.comment,});

  FeedBackDTO.fromJson(dynamic json) {
    user = json['user'];
    rate = json['rate'];
    comment = json['comment'];
  }
  String? user;
  num? rate;
  String? comment;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['user'] = user;
    map['rate'] = rate;
    map['comment'] = comment;
    return map;
  }

  FeedBack toDomain(){
    return FeedBack(
      user: user,
      rate: rate,
      comment: comment,
    );
  }

}