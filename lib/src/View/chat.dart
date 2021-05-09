import 'dart:math';

import 'package:flutter/material.dart';
import 'package:gamechat/src/View/loading.dart';
import 'package:get/get.dart';

import 'chatMessage.dart';

class Chat extends StatefulWidget {
  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  final List<ChatMessage> messages = <ChatMessage>[];
  final TextEditingController _textController = TextEditingController();
  FocusNode myFocusNode = FocusNode();
  bool isText = false;
  int result = Random().nextInt(100) + 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.pink[100],
          title: Text('업다운 게임'),
          centerTitle: true,
          elevation: 5),
      body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('./assets/Chat/backgroundimage.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              // 리스트뷰를 Flexible로 추가.
              Flexible(
                child: ListView.builder(
                  padding: const EdgeInsets.all(8.0),
                  // 리스트뷰의 스크롤 방향을 반대로 변경. 최신 메시지가 하단에 추가
                  reverse: true,
                  itemCount: messages.length,
                  itemBuilder: (_, index) => messages[index],
                ),
              ),
              //채팅창

              Divider(height: 1.0),
              //입력창
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                ),
                child: TextInputWindow(),
              )
            ],
          )),
    );
  }

  Widget TextInputWindow() {
    return IconTheme(
      data: IconThemeData(color: Theme.of(context).accentColor),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: <Widget>[
            // 텍스트 입력 필드
            Flexible(
              child: TextField(
                //포커스 주기!
                focusNode: myFocusNode,
                // 컨트롤러로 변화값 저장
                controller: _textController,
                // 입력된 텍스트에 변화가 있을 때 마다
                onChanged: (text) {
                  setState(() {
                    isText = text.length > 0;
                  });
                },
                // 키보드상에서 확인을 누를 경우. 입력값이 있을 때에만 _handleSubmitted 호출
                onSubmitted: isText ? handleSubmitted : null,
                decoration: InputDecoration.collapsed(hintText: "메세지를 입력해주세요"),
              ),
            ),
            // 전송 버튼
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 4.0),
              // 플랫폼 종류에 따라 적당한 버튼 추가
              child: IconButton(
                // 아이콘 버튼에 전송 아이콘 추가
                icon: Icon(Icons.send),
                // 입력된 텍스트가 존재할 경우에만 handleSubmitted 호출
                onPressed:
                    isText ? () => handleSubmitted(_textController.text) : null,
              ),
            ),
          ],
        ),
      ),
    );
  }

  handleSubmitted(String text) {
    _textController.clear();
    setState(() {
      isText = false;
    });
    // 입력받은 텍스트를 이용해서 리스트에 추가할 메시지 생성
    ChatMessage message = ChatMessage(
      text: text,
      result: result,
    );
    // 리스트에 메시지 추가
    setState(() {
      messages.insert(0, message);
    });
  }
}
