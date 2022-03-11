

class User {


  late String userName;
  late String cardNumber;
  late String cvv2;
  late String data;

  User({
    required  this.userName,
    required  this.cardNumber,
    required this.cvv2,
    required  this.data,
  });

  User.fromJson(Map<String, dynamic> json) {
    userName = json['userName'];
    cardNumber = json['cardNumber'];
    data = json['data'];
    cvv2 = json["cvv2"];
   
  }

  Map<String, dynamic> toJson() => {
    'userName': userName,
    'cardNumber': cardNumber,
    'data': data,
    'cvv2': cvv2,
  };
}