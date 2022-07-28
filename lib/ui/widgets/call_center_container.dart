import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CallCenterContainer extends StatelessWidget {
  const CallCenterContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 80.0, bottom: 80),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery.of(context).size.width/8,
          ),
          Container(
            height: 300,
            width: 500,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/call_center.jpeg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 20),
            height: 240,
            width: 500,
            decoration: BoxDecoration(
              border: Border.all(color: Color(0xFFD9D9D9), width: 1),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "CALL CENTAR",
                  style: TextStyle(color: Colors.red, fontSize: 20),
                ),
                SizedBox(height: 20),
                Text(
                  "Nasi operateri stoje Vam na usluzi za sve potrebne informacije.",
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 20),
                Text(
                  "RADNO VREME CALL CENTRA:",
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  "Ponedeljak - Petak od 08 do 16h",
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 40),
                Text(
                  "+381 66 624.29.59",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.red),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
