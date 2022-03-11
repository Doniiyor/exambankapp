import 'package:exambankapp/models/user_models.dart';
import 'package:exambankapp/pages/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_brand.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';


class MainPage extends StatefulWidget {
  String cardNumber;
  String expiryDate;
  String cardHolderName;
  String cvvCode;

  static final String id = "MainPage";
  MainPage({
    Key? key,
    required this.cardNumber,
    required this.expiryDate,
    required this.cardHolderName,
    required this.cvvCode,
  }) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late String userName;
  late String cardNumber;
  late String cvv2;
  late DateTime data;
  User user = User(userName: "wekdh", cardNumber: "wekjd", cvv2: "4", data: "null");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      ///APPBar
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Good Morning",
              style: TextStyle(color: Colors.black),
            ),
            SizedBox(height: 5,),
            Text(
              "Eugene",
              style: TextStyle(color: Colors.black),
            ),
          ],
        ),
        actions: [
          Container(
            padding: EdgeInsets.only(right: 10),
            child: CircleAvatar(
              radius: 20,
              backgroundColor: Colors.red,
              backgroundImage: AssetImage("assets/images/profile.jpg"),
            ),
          ),
        ],
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            CreditCardWidget(
              cardNumber: widget.cardNumber,
              expiryDate: widget.expiryDate,
              cardHolderName: widget.cardHolderName,
              cvvCode: widget.cvvCode,
              labelCardHolder: ("CARD HOLDER"),
              labelExpiredDate: 'MM/YY',
              showBackView: false,
              isHolderNameVisible: true,
              isSwipeGestureEnabled: true,
              cardBgColor: Color(0xff1b447b),
              cardType: CardType.visa,
              customCardTypeIcons: <CustomCardTypeIcon>[

                ],
              onCreditCardWidgetChange:(CreditCardBrand creditCardBrand) {

              },),
            IconButton(onPressed: () {
              Navigator.pushNamed(context, ProfilePage.id);
            }, icon: Icon(Icons.add))
          ],
        ),
      ),
    );
  }
}
