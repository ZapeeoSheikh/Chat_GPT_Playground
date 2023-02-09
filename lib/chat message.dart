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
import 'package:untitled/Ui%20Kit/ui.dart';
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
        // Text(sender)
        //     .text
        //     .subtitle1(context)
        //     .make()
        //     .box
        //     .color(sender == "you" ? Vx.red200 : Vx.green200)
        //     .p16
        //     .rounded
        //     .alignCenter
        //     .makeCentered(),
        ClipRRect(
          borderRadius: BorderRadius.circular(25.0),
          child: Image(
            // color: MyColor.mainColor1,
                  image: NetworkImage(
                    sender == "bot" ?  "https://img.freepik.com/premium-vector/cute-robot-waving-hand-cartoon-illustration_138676-2744.jpg" : "https://avatars.githubusercontent.com/u/77886136?v=4"),
                  width: 50,
                  height: 50,
                fit: BoxFit.cover,

              ),
            ),


        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Expanded(
            child: isImage
                ? Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
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
                : Container(
              width: MediaQuery.of(context).size.width * 0.7,
                decoration: BoxDecoration(
                  color: sender == "bot" ? MyColor.mainColor2 : MyColor.mainColor1,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: text.trim().text.bodyText1(context).make().px8())),
          ),
        ),
      ],
    ).py8();
  }
}
