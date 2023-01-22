import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:untitled/chat%20message.dart';
import 'package:velocity_x/velocity_x.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final _controller = TextEditingController();
  List<ChatMessage> _messages = [];

  
  void _sendMessage(){
    ChatMessage _message = ChatMessage(sender: "M Rameez", message: _controller.text);


    setState(() {
      _messages.insert(0, _message);

      _controller.clear();
    });
  }

  Widget _textComposser() {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: _controller,
            decoration: InputDecoration.collapsed(
              hintText: "Send a message",
            ),
          ),
        ),
        IconButton(
          onPressed: () {
            if(_controller.text != "") {
              _sendMessage();
            }
          },
          icon: Icon(Icons.send),
          color: context.primaryColor,
        )
      ],
    ).px16();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        // backgroundColor: context.cardColor,
        title: Text(
          "CHAT GPT PLAYGROUND",
          style: TextStyle(fontSize: 18, color: Colors.black54),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Flexible(
                child: ListView.builder(
                  reverse: true,
                    itemCount: _messages.length,
                    itemBuilder: (context, index) {
                      return Container(
                        // color: Colors.red,
                        height: 50,
                        child: _messages[index],
                      ).p16();
                    })),
            Container(
              decoration: BoxDecoration(
                color: context.cardColor,
              ),
              child: _textComposser(),
            )
          ],
        ),
      ),
    );
  }
}