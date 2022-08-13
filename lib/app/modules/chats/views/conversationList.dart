import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:my_trip/app/modules/chats/controllers/chats_controller.dart';
import 'package:my_trip/app/modules/chats/views/chatDetailPage.dart';
import 'package:my_trip/app/routes/app_pages.dart';

class ConversationList extends StatelessWidget {
  final chatController = Get.find<ChatsController>();
  String? name;
  String? messageText;
  String? imageUrl;
  String? time;
  int? chatId;

  ConversationList({
    Key? key,
    required this.name,
    required this.messageText,
    required this.imageUrl,
    required this.time,
    required this.chatId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        print("this is-------------chatId ");
        print(chatId);

        // Navigator.push(context, MaterialPageRoute(builder: (context) {
        //   return ChatDetailPage();
        // }));
        // Get.toNamed(Routes.CHAT_DETAILS_PAGE);
        await chatController.showChat(chatId);
      },
      child: Container(
        padding:
            const EdgeInsets.only(left: 16, right: 16, top: 10, bottom: 10),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(imageUrl!),
                    maxRadius: 30,
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: Container(
                      color: Colors.transparent,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "${name}",
                            style: const TextStyle(fontSize: 16),
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          Text(
                            messageText!,
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.grey.shade600,
                              // fontWeight: widget.isMessageRead!
                              //     ? FontWeight.bold
                              //     : FontWeight.normal
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Text(
              time!,
              style: TextStyle(
                fontSize: 12,
                // fontWeight: widget.isMessageRead!
                //     ? FontWeight.bold
                //     : FontWeight.normal
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// class ConversationList extends StatefulWidget {
//   final chatController = Get.find<ChatsController>();
//   String? name;
//   String? messageText;
//   String? imageUrl;
//   String? time;
//   ChatsController chatController;
//
//   // bool? isMessageRead;
//
//   ConversationList({
//     Key? key,
//     @required this.name,
//     @required this.messageText,
//     @required this.imageUrl,
//     @required this.time,
//     required this.chatController,
//     // @required this.isMessageRead
//   }) : super(key: key);
//
//   @override
//   _ConversationListState createState() => _ConversationListState();
// }
//
// class _ConversationListState extends State<ConversationList> {
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () async {
//         // Navigator.push(context, MaterialPageRoute(builder: (context) {
//         //   return ChatDetailPage();
//         // }));
//        // Get.toNamed(Routes.CHAT_DETAILS_PAGE);
//         await chatController.sh
//       },
//       child: Container(
//         padding:
//             const EdgeInsets.only(left: 16, right: 16, top: 10, bottom: 10),
//         child: Row(
//           children: <Widget>[
//             Expanded(
//               child: Row(
//                 children: [
//                   CircleAvatar(
//                     backgroundImage: NetworkImage(widget.imageUrl!),
//                     maxRadius: 30,
//                   ),
//                   const SizedBox(
//                     width: 16,
//                   ),
//                   Expanded(
//                     child: Container(
//                       color: Colors.transparent,
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: <Widget>[
//                           Text(
//                             "${widget.name}",
//                             style: const TextStyle(fontSize: 16),
//                           ),
//                           const SizedBox(
//                             height: 6,
//                           ),
//                           Text(
//                             widget.messageText!,
//                             style: TextStyle(
//                               fontSize: 13,
//                               color: Colors.grey.shade600,
//                               // fontWeight: widget.isMessageRead!
//                               //     ? FontWeight.bold
//                               //     : FontWeight.normal
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Text(
//               widget.time!,
//               style: TextStyle(
//                 fontSize: 12,
//                 // fontWeight: widget.isMessageRead!
//                 //     ? FontWeight.bold
//                 //     : FontWeight.normal
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
