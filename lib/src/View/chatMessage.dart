import 'package:flutter/material.dart';
import 'package:gamechat/src/Controller/number.controller.dart';
import 'package:get/get.dart';

import 'loading.dart';

class ChatMessage extends StatelessWidget {
  String text;
  int result;
  int _text;
  String resultText = "";

  ChatMessage({this.text, this.result});
  _buildresult() {
    try {
      _text = int.parse(text);
    } catch (e) {
      _text = 0;
    }

    if (!(_text >= 1 && _text <= 100)) {
      resultText = "1부터 100까지 숫자를 입력해주세요";
    } else {
      if (result == _text) {
        resultText = "정답입니다";
      } else if (result >= _text) {
        if (NumberController.to.min < _text) {
          NumberController.to.setMin(_text);
        }
        resultText = "UP";
        resultText +=
            " (hint : ${NumberController.to.min.value} ~ ${NumberController.to.max.value} 까지의 값을 입력해주세요)";
      } else if (result <= _text) {
        if (NumberController.to.max > _text) {
          NumberController.to.setMax(_text);
        }
        resultText = "DOWN";
        resultText +=
            " (hint : ${NumberController.to.min.value} ~ ${NumberController.to.max.value} 까지의 값을 입력해주세요)";
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    Get.put(NumberController());
    FocusScopeNode currentFocus = FocusScope.of(context);
    _buildresult();
    print('result $result');
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                  ),
                  border: Border.all(
                    color: Colors.yellow,
                  ),
                  color: Colors.yellow,
                ),
                padding: EdgeInsets.all(10),
                child: Text(text),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(10),
          ),
          Row(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(right: 5.0),
                child: CircleAvatar(
                  child: Text("AI", style: TextStyle(color: Colors.white)),
                  backgroundColor: Colors.pink[200],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                  border: Border.all(
                    color: Colors.white,
                  ),
                  color: Colors.white,
                ),
                padding: EdgeInsets.all(10),
                child: Text(resultText),
              ),
            ],
          ),
          (() {
            if (resultText == "정답입니다") {
              currentFocus.unfocus();

              return Column(
                children: [
                  Center(
                    child: Container(
                      padding: EdgeInsets.all(10),
                      child: Text("게임이 종료되었습니다"),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      NumberController.to.setInit();
                      Get.to(Loading());
                    },
                    child: Center(
                      child: Container(
                        padding: EdgeInsets.all(10),
                        child: Text("채팅방 나가기",
                            style: TextStyle(color: Colors.pink)),
                      ),
                    ),
                  ),
                ],
              );
            } else
              return Container();
          }()),
        ],
      ),
    );
  }
}
