import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'chat.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FocusScopeNode currentFocus = FocusScope.of(context);
    currentFocus.unfocus();
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            stops: [0.1, 0.5, 0.7, 0.9],
            colors: [
              Colors.pink[200],
              Colors.pink[200],
              Colors.pink[200],
              Colors.pink[200],
            ],
          ),
        ),
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            Image.network(
              'https://i.pinimg.com/564x/74/31/27/7431279fe525b0f065d7357496ad58a0.jpg',
              height: MediaQuery.of(context).size.height,
            ),
            Column(
              children: [
                Padding(padding: EdgeInsets.only(top: 290)),
                Center(
                  child: Text("UP DOWN GAME",
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: "NotoSansCJKkr_Medium",
                          fontSize: 25),
                      textAlign: TextAlign.left),
                ),
                Padding(padding: EdgeInsets.only(top: 150)),
                RaisedButton(
                  padding: EdgeInsets.all(10),
                  color: Colors.white, // background
                  onPressed: () {
                    Get.to(Chat());
                  },
                  child: Text(' 게임 시작 ',
                      style: TextStyle(
                          color: Colors.pink[300],
                          fontFamily: "NotoSansCJKkr_Medium",
                          fontSize: 25),
                      textAlign: TextAlign.left),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
