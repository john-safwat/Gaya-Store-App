import 'package:ecommerce/Domain/Models/Products/FeedBack.dart';

class FeedBackDTO {
  FeedBackDTO({
      this.user, 
      this.rate, 
      this.comment,
      this.userImage
  });

  FeedBackDTO.fromJson(dynamic json) {
    user = json['user'];
    rate = json['rate'];
    comment = json['comment'];
    userImage = json['userImage'];
  }
  String? user;
  num? rate;
  String? comment;
  String? userImage;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['user'] = user;
    map['rate'] = rate;
    map['comment'] = comment;
    map['userImage']= userImage;
    return map;
  }

  FeedBack toDomain(){
    return FeedBack(
      user: user,
      rate: rate,
      comment: comment,
      userImage: userImage
    );
  }

}