import 'dart:convert';
import 'dart:io';

import 'package:flex_pozivnica_za_kurira/ui/widgets/call_center_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../labels.dart';
import 'columns/delivery_details_column.dart';
import 'columns/receiver_column.dart';
import 'columns/sender_column.dart';
import 'footer/custom_app_footer.dart';
import 'header/custom_app_header.dart';
import 'package:http/http.dart' as http;


class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

TextEditingController controllerSenderNameSurname = TextEditingController();
TextEditingController controllerSenderCity = TextEditingController();
TextEditingController controllerSenderAddress= TextEditingController();
TextEditingController controllerSenderHomeNumber= TextEditingController();
TextEditingController controllerSenderPostalNumber= TextEditingController();
TextEditingController controllerSenderPhone = TextEditingController();
TextEditingController controllerSenderContact= TextEditingController();
TextEditingController controllerSenderEmail= TextEditingController();
TextEditingController controllerSenderNote= TextEditingController();
TextEditingController controllerReceiverNameSurname = TextEditingController();
TextEditingController controllerReceiverCity = TextEditingController();
TextEditingController controllerReceiverAddress = TextEditingController();
TextEditingController controllerReceiverHomeNumber= TextEditingController();
TextEditingController controllerReceiverPostalNumber= TextEditingController();
TextEditingController controllerReceiverPhone = TextEditingController();
TextEditingController controllerReceiverContact = TextEditingController();
TextEditingController controllerReceiverNote = TextEditingController();
TextEditingController controllerDeliveryContent = TextEditingController();
TextEditingController controllerDeliveryBuyOut = TextEditingController();
TextEditingController controllerDeliveryValue = TextEditingController();
TextEditingController controllerNumber = TextEditingController();
String startingValueWeight = '';
String startingValueDelivery = '';
String startingValuePayment = '';
List<String> selected = [];


class _MainScreenState extends State<MainScreen> {


  bool isClicked = false;
  Future<http.Response> sendEmail() async {
    final queryParameters = {
      'senderNameSurname': controllerSenderNameSurname.text,
      'senderCity' : controllerSenderCity.text,
      'senderAddress': controllerSenderAddress.text,
      'senderHomeNumber' : controllerSenderHomeNumber.text,
      'senderPostalNumber' : controllerSenderPostalNumber.text,
      'senderPhone' : controllerSenderPhone.text,
      'senderContact' : controllerSenderContact.text,
      'senderEmail' : controllerSenderEmail.text,
      'senderNote' : controllerSenderNote.text,
      'receiverNameSurname' : controllerReceiverNameSurname.text,
      'receiverCity' : controllerReceiverCity.text,
      'receiverAddress' : controllerReceiverAddress.text,
      'receiverHomeNumber' : controllerReceiverHomeNumber.text,
      'receiverPostalNumber' : controllerReceiverPostalNumber.text,
      'receiverPhone' : controllerReceiverPhone.text,
      'receiverContact' : controllerReceiverContact.text,
      'receiverNote' : controllerReceiverNote.text,
      'deliveryContent' : controllerDeliveryContent.text,
      'deliveryBuyOut' : controllerDeliveryBuyOut.text,
      'deliveryValue' : controllerDeliveryValue.text,
      'deliveryWeight' : startingValueWeight,
      'deliveryPayment' : startingValuePayment,
      'deliveryTime' : startingValueDelivery,
      'additionalServices' : selected,
      'packageNumber' : controllerNumber.text,
    };

    final uri = Uri.https('us-central1-flexpozivnicazakurira.cloudfunctions.net', '/sendMail', queryParameters);
    final response = await http.get(uri);
    return response;

  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              CustomAppHeader(),
              Center(
                child: Padding(
                  padding: EdgeInsets.all(40.0),
                  child: Text(
                    kHeadingMessage,
                    style: TextStyle(color: Color(0xffc0ad93), fontSize: 32),
                  ),
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SenderColumn(
                    controllerSenderNameSurname: controllerSenderNameSurname,
                    controllerSenderAddress: controllerSenderAddress,
                    controllerSenderCity: controllerSenderCity,
                    controllerSenderHomeNumber: controllerSenderHomeNumber,
                    controllerSenderPostalNumber: controllerSenderPostalNumber,
                    controllerSenderPhone: controllerSenderPhone,
                    controllerSenderContact: controllerSenderContact,
                    controllerSenderEmail: controllerSenderEmail,
                    controllerSenderNote: controllerSenderNote,
                  ),
                  SizedBox(width: 83),
                  ReceiverColumn(
                      controllerReceiverNameSurname: controllerReceiverNameSurname,
                      controllerReceiverCity: controllerReceiverCity,
                      controllerReceiverAddress: controllerReceiverAddress,
                      controllerReceiverPostalNumber: controllerReceiverPostalNumber,
                      controllerReceiverHomeNumber: controllerReceiverHomeNumber,
                      controllerReceiverContact: controllerReceiverContact,
                      controllerReceiverNote: controllerReceiverNote,
                      controllerReceiverPhone: controllerReceiverPhone
                  ),
                  SizedBox(width: 83),
                  DeliveryDetails(
                    controllerDeliveryContent: controllerDeliveryContent,
                    controllerDeliveryBuyOut: controllerDeliveryBuyOut,
                    controllerDeliveryValue: controllerDeliveryValue,
                    controllerNumber: controllerNumber,
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 635, bottom: 60),
                child: GestureDetector(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 12, left: 20, right: 20),
                    child: Container(
                      color: Colors.red,
                      width: 383,
                      height: 50,
                      child: Center(
                        child: Text(
                          kConfirmButton,
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  onTap: (){
                    if(controllerReceiverNameSurname.text.isEmpty || controllerSenderNameSurname.text.isEmpty || controllerReceiverCity.text.isEmpty || controllerSenderCity.text.isEmpty || controllerReceiverAddress.text.isEmpty || controllerSenderAddress.text.isEmpty || controllerReceiverPhone.text.isEmpty || controllerSenderPhone.text.isEmpty || startingValueWeight.isEmpty || startingValuePayment.isEmpty) {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text("GREŠKA"),
                          content: Text("Niste popunili sva obavezna polja"),
                          actions: [
                            TextButton(
                              child: Text("OK"),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        ),
                      );
                    } else {
                      setState(() {
                        isClicked = true;
                      });
                      sendEmail();
                    }
                  },
                ),
              ),
              isClicked ? Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 30.0, right: 40),
                    child: Text(konClickMessage, style: TextStyle(color: Colors.black, fontSize: 28),),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 30.0),
                    child: Text(konClickTermsMessage, style: TextStyle(color: Colors.black, fontSize: 14),),
                  ),
                ],
              ) : Container(),
              CustomAppFooter(),
              CallCenterContainer(),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 350,
                color: Color(0xffc0ad93),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IntrinsicHeight(
                      child: Container(
                        padding: EdgeInsets.only(top: 50),
                        width: MediaQuery.of(context).size.width*0.7,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 250,
                                  height: 80,
                                  child: Image.asset('assets/images/flex_logo.png'),
                                ),
                                SizedBox(height: 20),
                                Padding(
                                  padding: EdgeInsets.only(left: 75.0),
                                  child: Row(
                                    children: [
                                      Icon(Icons.place, color: Colors.red),
                                      SizedBox(width: 10),
                                      Text("Beograd", style: TextStyle(fontSize: 12, color: Colors.white),),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 10),
                                Padding(
                                  padding: EdgeInsets.only(left: 75.0),
                                  child: Row(
                                    children: [
                                      Icon(Icons.mail, color: Colors.red),
                                      SizedBox(width: 10),
                                      Text("office@flex-kurir.rs", style: TextStyle(fontSize: 12, color: Colors.white),),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 10),
                                Padding(
                                  padding: EdgeInsets.only(left: 75.0),
                                  child: Row(
                                    children: [
                                      Icon(Icons.phone, color: Colors.red),
                                      SizedBox(width: 10),
                                      Text("(+381) 11 624.29.59", style: TextStyle(fontSize: 12, color: Colors.white),),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(width: 100),
                            VerticalDivider(
                              color: Colors.white,
                              width: 1,
                              thickness: 1,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 30.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Usluge",
                                    style: TextStyle(fontSize: 16, color: Colors.white),
                                  ),
                                  SizedBox(height: 20,),
                                  Text("Dostava Beograd", style: TextStyle(fontSize: 12, color: Colors.white),),
                                  SizedBox(height: 20,),
                                  Text("Dostava za danas", style: TextStyle(fontSize: 12, color: Colors.white),),
                                  SizedBox(height: 20,),
                                  Text("Dostava za sutra", style: TextStyle(fontSize: 12, color: Colors.white),),
                                  SizedBox(height: 20,),
                                  Text("B2C dostava", style: TextStyle(fontSize: 12, color: Colors.white),),
                                  SizedBox(height: 20,),
                                  Text("B2B Dostava", style: TextStyle(fontSize: 12, color: Colors.white),),
                                ],
                              ),
                            ),
                            Expanded(child: Container(),),
                            VerticalDivider(
                              color: Colors.white,
                              width: 1,
                              thickness: 1,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 30.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Korisne informacije",
                                    style: TextStyle(fontSize: 16, color: Colors.white),
                                  ),
                                  SizedBox(height: 20,),
                                  Text("Najcesca pitanja", style: TextStyle(fontSize: 12, color: Colors.white),),
                                  SizedBox(height: 20,),
                                  Text("Cenovnik", style: TextStyle(fontSize: 12, color: Colors.white),),
                                  SizedBox(height: 20,),
                                  Text("Uslovi koriscenja", style: TextStyle(fontSize: 12, color: Colors.white),),
                                  SizedBox(height: 20,),
                                  Text("Zakazi kurira", style: TextStyle(fontSize: 12, color: Colors.white),),
                                ],
                              ),
                            ),
                            Expanded(child: Container(),),
                            VerticalDivider(
                              color: Colors.white,
                              width: 1,
                              thickness: 1,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 30.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "KONTAKTIRAJTE NAS!",
                                    style: TextStyle(fontSize: 16, color: Colors.white),
                                  ),
                                  SizedBox(height: 20,),
                                  Text("Tu smo za sva vasa pitanja", style: TextStyle(fontSize: 12, color: Colors.white),),
                                  SizedBox(height: 30,),
                                  Container(
                                      color: Colors.red,
                                      width: 144,
                                      height: 35,
                                      child: Center(child: Text("KONTAKT", style: TextStyle(fontSize: 14, color: Colors.white),))),
                                  SizedBox(height: 40),
                                  Text("Zaprati nas!", style: TextStyle(fontSize: 14, color: Colors.white),),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(child: Container(),),
                    Divider(color: Colors.white, height: 1),
                    Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width*0.7,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("© Copyright 2022 Flex kurirska služba, sva prava zadržana. Design By Marketing iz garaže", style: TextStyle(color: Colors.red, fontSize: 10),),
                          Expanded(child: Container()),
                          Text('Politika privatnosti', style: TextStyle(color: Colors.white, fontSize: 10),),
                          SizedBox(width: 80,),
                          Text("O nama", style: TextStyle(color: Colors.white, fontSize: 10),),
                          SizedBox(width: 80,),
                          Text('Kontakt', style: TextStyle(color: Colors.white, fontSize: 10),),
                          SizedBox(width: 80,),
                          Text('Novosti', style: TextStyle(color: Colors.white, fontSize: 10),),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


