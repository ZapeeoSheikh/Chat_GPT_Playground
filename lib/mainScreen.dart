import 'dart:async';
import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
import 'package:flutter/material.dart';
import 'package:untitled/Ui%20Kit/ui.dart';
import 'package:velocity_x/velocity_x.dart';
import 'chat message.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _controller = TextEditingController();
  final List<ChatMessage> _messages = [];
  ChatGPT? chatGPT;
  bool _isImageSearch = false;

  StreamSubscription? _subscription;
  bool _isTyping = false;

  @override
  void initState() {
    super.initState();
    chatGPT = ChatGPT.instance.builder(
      "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",
    );
  }

  @override
  void dispose() {
    chatGPT!.genImgClose();
    _subscription?.cancel();
    super.dispose();
  }

  // Link for api - https://beta.openai.com/account/api-keys

  void _sendMessage() {
    if (_controller.text.isEmpty) return;
    ChatMessage message = ChatMessage(
      text: _controller.text,
      sender: "you",
      isImage: false,
    );

    setState(() {
      _messages.insert(0, message);
      _isTyping = true;
    });

    _controller.clear();

    if (_isImageSearch) {
      final request = GenerateImage(message.text, 1, size: "256x256");

      _subscription = chatGPT!
          .generateImageStream(request)
          .asBroadcastStream()
          .listen((response) {
        Vx.log(response.data!.last!.url!);
        insertNewData(response.data!.last!.url!, isImage: true);
      });
    } else {
      final request = CompleteReq(
          prompt: message.text, model: kTranslateModelV3, max_tokens: 200);

      _subscription = chatGPT!
          .onCompleteStream(request: request)
          .asBroadcastStream()
          .listen((response) {
        Vx.log(response!.choices[0].text);
        insertNewData(response.choices[0].text, isImage: false);
      });
    }
  }

  void insertNewData(String response, {bool isImage = false}) {
    ChatMessage botMessage = ChatMessage(
      text: response,
      sender: "bot",
      isImage: isImage,
    );

    setState(() {
      _isTyping = false; // stop typing
      _messages.insert(0, botMessage);
    });
  }

  Widget _buildTextComposer() {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: _controller,
            onSubmitted: (value) => _sendMessage(),
            decoration: const InputDecoration.collapsed(
                hintText: "Question/description"),
          ),
        ),
        ButtonBar(
          children: [
            IconButton(
              icon: const Icon(Icons.send),
              onPressed: () {
                _isImageSearch = false;
                _sendMessage();
              },
            ),
            TextButton(
                onPressed: () {
                  _isImageSearch = true;
                  _sendMessage();
                },
                child: const Text("Generate Image"))
          ],
        ),
      ],
    ).px16();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          "Images/backgroundChat.jpeg",
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
        Scaffold(
          // backgroundColor: MyColor.backgroundColor,
          appBar: AppBar(
            title: Text(
              "ChatGPT & Dall-E2 Demo",
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: MyColor.backgroundColor,
          ),
          body: SafeArea(
            child: Column(
              children: [
                Flexible(
                    child: Stack(
                  children: [
                    ListView.builder(
                      reverse: true,
                      padding: Vx.m8,
                      itemCount: _messages.length,
                      itemBuilder: (context, index) {
                        return _messages[index];
                      },
                    ),
                    _isTyping
                        ? Center(
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(15.0),
                                child: Image.network(
                                    'https://static.vectorcharacters.net/uploads/2013/11/Cute_Vector_Robot_Character_Preview.gif',
                                    width: 120,
                                    height: 180)))
                        : Container(),
                  ],
                )),
                Divider(
                  height: 1.0,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: context.cardColor,
                  ),
                  child: _buildTextComposer(),
                )
              ],
            ),
          )),],
    );
  }
}


