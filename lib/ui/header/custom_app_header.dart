import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../labels.dart';

class CustomAppHeader extends StatelessWidget {
  const CustomAppHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/header_background_image.jpeg"),
          fit: BoxFit.cover,
        ),
      ),
      height: 600,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          IntrinsicHeight(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width/6,
                ),
                Text('Pozovite nas bilo kad. Stižemo bilo gde!', style: TextStyle(fontSize: 16, color: Colors.white),),
                Expanded(child: Container()),
                VerticalDivider(color: Colors.white, width: 1,),
                SizedBox(width: 15,),
                Row(
                  children: [
                    Icon(Icons.phone, size: 30, color: Colors.red),
                    Padding(
                      padding: EdgeInsets.only(left: 8.0, top: 20, bottom: 10),
                      child: Text(kFlexPhoneNumber, style: TextStyle(fontSize: 16, color: Colors.white),),
                    ),
                  ],
                ),
                SizedBox(width: 15,),
                VerticalDivider(color: Colors.white, width: 1,),
                Container(
                  width: MediaQuery.of(context).size.width/8,
                ),
              ],
            ),
          ),
          Divider(color: Colors.white, height: 1),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width/8,
              ),
              Expanded(
                child: Container(
                  height: 100,
                  child: Image.asset('assets/images/flex_logo.png'),
                ),
              ),
              Expanded(child: Container()),
              Text('Usluge', style: TextStyle(color: Colors.white, fontSize: 16),),
              SizedBox(width: 70),
              Text('Pocetna', style: TextStyle(color: Colors.white, fontSize: 16),),
              SizedBox(width: 70),
              Text('Zakazi kurira', style: TextStyle(color: Colors.white, fontSize: 16),),
              SizedBox(width: 70),
              Text('Cenovnik  ', style: TextStyle(color: Colors.white, fontSize: 16),),
              SizedBox(width: 70),
              Text('Kontakt', style: TextStyle(color: Colors.white, fontSize: 16),),
              Container(
                width: MediaQuery.of(context).size.width/8,
              ),
            ],
          ),
          Divider(color: Colors.white, height: 1),
          SizedBox(height: 100),
          Column(
            children: [
              Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width/5,
                  ),
                  Text("Zakaži dolazak kurira", style: TextStyle(color: Colors.white, fontSize: 32, letterSpacing: 2),),
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width/5,
                  ),
                  Icon(Icons.house_outlined, size: 30, color: Colors.red,),
                  SizedBox(width: 10),
                  Text("Početna - Flex kurirska služba", style: TextStyle(fontSize: 16, color: Colors.white, letterSpacing: 2),),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
