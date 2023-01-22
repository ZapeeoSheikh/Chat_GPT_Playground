import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class ChatMessage extends StatelessWidget {
  const ChatMessage({Key? key, required this.sender, required this.message}) : super(key: key);
   final String sender;
   final String message;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        CircleAvatar(
         child: Text(sender[0]),
        ),
        SizedBox(width: 10,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              sender,
              style: Theme.of(context).textTheme.subtitle1,
            ),
            Text(
              message,
              style: TextStyle(color: context.primaryColor),
            ),
          ],
        ),
      ],
    );
  }
}
