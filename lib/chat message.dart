// import 'package:flutter/material.dart';
// import 'package:velocity_x/velocity_x.dart';
//
// class ChatMessage extends StatelessWidget {
//   const ChatMessage({Key? key, required this.sender, required this.message}) : super(key: key);
//    final String sender;
//    final String message;
//
//   @override
//   Widget build(BuildContext context) {
//     String api = "https://api.gptplayground.com/v1/chat";
//     String apikey = "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";
//
//     return Row(
//       crossAxisAlignment: CrossAxisAlignment.start,
//
//       children: [
//         CircleAvatar(
//          child: Text(sender[0]),
//         ),
//         SizedBox(width: 10,),
//         Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               sender,
//               style: Theme.of(context).textTheme.subtitle1,
//             ),
//             Text(
//               message,
//               style: TextStyle(color: context.primaryColor),
//             ),
//           ],
//         ),
//       ],
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class ChatMessage extends StatelessWidget {
  const ChatMessage(
      {super.key,
        required this.text,
        required this.sender,
        this.isImage = false});

  final String text;
  final String sender;
  final bool isImage;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(sender)
            .text
            .subtitle1(context)
            .make()
            .box
            .color(sender == "user" ? Vx.red200 : Vx.green200)
            .p16
            .rounded
            .alignCenter
            .makeCentered(),
        Expanded(
          child: isImage
              ? Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              // color: context.cardColor,
              borderRadius: BorderRadius.circular(20),
            ),
                child: Image.network(
                  text,
                  loadingBuilder: (context, child, loadingProgress) =>
                  loadingProgress == null
                      ? child
                      : const CircularProgressIndicator.adaptive(),
                  fit: BoxFit.scaleDown,
                ),

              )
              : text.trim().text.bodyText1(context).make().px8(),
        ),
      ],
    ).py8();
  }
}



