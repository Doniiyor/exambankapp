
import 'package:exambankapp/models/user_models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_model.dart';


import '../services/http_services.dart';
import 'main_pages.dart';


class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);
  static const String id = "profile_page";

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  TextEditingController cardNumberController = TextEditingController();
  TextEditingController dataController = TextEditingController();
  TextEditingController cvvController = TextEditingController();
  TextEditingController userNameController = TextEditingController();

  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';

  saveCard() {
    String cardNumber = cardNumberController.text.trim().toString();
    String userName = userNameController.text.trim().toString();
    String data = dataController.text.trim().toString();
    String cvv2 = cvvController.text.trim().toString();
    if (cardNumber.isEmpty ||
        userName.isEmpty ||
        data.isEmpty ||
        cvv2.isEmpty) return null;
    User user = User(userName: userName, cardNumber: cardNumber, cvv2: cvv2, data: data);
    Network.POST(Network.API_CREATE, Network.paramsCreate(user)).then((value){
      getResponse(value);
    });
  }

  getResponse(String? response){
    if(response != null){
      Navigator.pop(context);
    }
  }

  void goToMainPage(){
    Navigator.of(context).push(MaterialPageRoute(builder: (context)=> MainPage(cardHolderName: cardHolderName, expiryDate: expiryDate, cvvCode: cvvCode, cardNumber: cardNumber,)));

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade900,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.blue.shade900,
        title: Text('Add your card'),
        actions: [
          TextButton(
              onPressed: () {
                saveCard();
                goToMainPage();
              },
              child: Text(
                "Save",
                style: TextStyle(fontSize: 18, color: Colors.white),
              )),
          SizedBox(
            width: 5,
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            SizedBox(
              height: 10,
            ),

            /// Card Number
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(
                        color: Color.fromRGBO(171, 171, 171, 0.7),
                        blurRadius: 20,
                        offset: Offset(0, 10)),
                  ]),
              child: TextField(
                maxLength: 16,
                controller: cardNumberController,
                cursorColor: Colors.grey,
                keyboardType: TextInputType.number,
                onChanged: (text) {
                  setState(() {
                    cardNumber = text;
                  });
                },
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.only(left: 5),
                  hintText: "Credit Card Number",
                  border: InputBorder.none,
                  hintStyle: TextStyle(fontSize: 15, color: Colors.grey),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),

            /// data and CVV
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: const [
                          BoxShadow(
                              color: Color.fromRGBO(171, 171, 171, 0.7),
                              blurRadius: 20,
                              offset: Offset(0, 10)),
                        ]),
                    child: TextField(
                      maxLength: 4,
                      controller: dataController,
                      cursorColor: Colors.grey,
                      keyboardType: TextInputType.number,
                      onChanged: (text) {
                        setState(() {
                          expiryDate = text;
                        });
                      },
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.only(left: 5),
                        hintText: "data",
                        border: InputBorder.none,
                        hintStyle: TextStyle(fontSize: 15, color: Colors.grey),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 50,
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: const [
                          BoxShadow(
                              color: Color.fromRGBO(171, 171, 171, 0.7),
                              blurRadius: 20,
                              offset: Offset(0, 10)),
                        ]),
                    child: TextField(
                      keyboardType: TextInputType.number,
                      controller: cvvController,
                      maxLength: 3,
                      cursorColor: Colors.grey,
                      onChanged: (text) {
                        setState(() {
                          cvvCode = text;
                        });
                      },
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.only(left: 5),
                        hintText: "CVV2",
                        border: InputBorder.none,
                        hintStyle: TextStyle(fontSize: 15, color: Colors.grey),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),

            /// name
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(
                        color: Color.fromRGBO(171, 171, 171, 0.7),
                        blurRadius: 20,
                        offset: Offset(0, 10)),
                  ]),
              child: TextField(
                controller: userNameController,
                cursorColor: Colors.grey,
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.only(left: 5),
                  hintText: "First Name",
                  border: InputBorder.none,
                  hintStyle: TextStyle(fontSize: 15, color: Colors.grey),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );

  }

  void onCreditCardModelChange(CreditCardModel? creditCardModel) {
    setState(() {
      cardNumber = creditCardModel!.cardNumber;
      expiryDate = creditCardModel.expiryDate;
      cardHolderName = userNameController.text;
      cvvCode = creditCardModel.cvvCode;
    //  isCvvFocused = creditCardModel.isCvvFocused;
    });
  }

}