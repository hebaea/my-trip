import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_trip/app/core/theme/color_theme.dart';
import 'package:my_trip/app/global_widgets/default_text.dart';
import 'package:my_trip/app/modules/chats/controllers/chats_controller.dart';
import '../controllers/chat_details_page_controller.dart';

class ChatDetailsPageView extends GetView<ChatDetailsPageController> {
  final chatsController = Get.find<ChatsController>();

  @override
  Widget build(BuildContext context) {
    print("chatsController.chatShow = ${chatsController.chatShow}");
    print("chatsController.createChat = ${chatsController.chatCreate}");
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        flexibleSpace: SafeArea(
          child: Container(
            padding: EdgeInsets.only(right: 16),
            child: Row(
              children: <Widget>[
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(
                  width: 2,
                ),

                CircleAvatar(
                  backgroundImage: NetworkImage(
                      "https://mytrip.justhost.ly/${chatsController.chatShow?.chat!.destination?.destinationImg}"),
                  maxRadius: 20,
                ),
                const SizedBox(
                  width: 12,
                ),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      DefaultText(
                          "${chatsController.chatShow?.chat!.destination?.destinationName}",
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                      // const Text(
                      //   "Kriss Benwat",
                      //   style: TextStyle(
                      //       fontSize: 16, fontWeight: FontWeight.w600),
                      // ),
                      const SizedBox(
                        height: 6,
                      ),
                      // Text(
                      //   "Online",
                      //   style: TextStyle(
                      //       color: Colors.grey.shade600, fontSize: 13),
                      // ),
                    ],
                  ),
                ),
                // Icon(
                //   Icons.settings,
                //   color: Colors.black54,
                // ),
              ],
            ),
          ),
        ),
      ),
      body: Stack(
        children: <Widget>[
          Obx(
            () => ListView.builder(
              itemCount: chatsController.msgList.length,
              shrinkWrap: true,
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Container(
                    padding: const EdgeInsets.only(
                        left: 16, right: 16, top: 10, bottom: 10),
                    child: Align(
                      alignment:
                          (chatsController.msgList[index].message?.from ==
                                  "Guest"
                              ? Alignment.topLeft
                              : Alignment.topRight),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color:
                              (chatsController.msgList[index].message?.from ==
                                      "Guest"
                                  ? Colors.grey.shade200
                                  : AppThemeColors.primaryLightColor),
                        ),
                        padding: const EdgeInsets.all(16),
                        child: DefaultText(
                            "${chatsController.msgList[index].message?.text}",
                            fontSize: 15),
                        // Text(
                        //   controller.chatShow?.chat?.messages![index].text,
                        //   style: const TextStyle(fontSize: 15),
                        // ),
                      ),
                    ));
              },
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              padding: const EdgeInsets.only(left: 10, bottom: 10, top: 10),
              height: 60,
              width: double.infinity,
              color: Colors.white,
              child: Row(
                children: <Widget>[
                  // GestureDetector(
                  //   onTap: () {},
                  //   child: Container(
                  //     height: 30,
                  //     width: 30,
                  //     decoration: BoxDecoration(
                  //       color: AppThemeColors.primaryColor,
                  //       borderRadius: BorderRadius.circular(30),
                  //     ),
                  //     child: const Icon(
                  //       Icons.add,
                  //       color: Colors.white,
                  //       size: 20,
                  //     ),
                  //   ),
                  // ),
                  const SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child:
                        //     RoundedInputField(
                        //       controller: controller.msgController,
                        //   hintText: 'اكتب رسالة',
                        //   icon: null,
                        //   onChanged: (String value) {},
                        //   readOnly: false,
                        // )

                        TextField(
                      controller: chatsController.msgController,
                      decoration: InputDecoration(
                          hintText: "اكتب رسالة",
                          hintStyle: TextStyle(color: Colors.black54),
                          border: InputBorder.none),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      chatsController.createMessage(
                          chatsController.chatCreate?.chat?.chatId);
                      print("controller.chatCreate?.chat!.chatId");
                      print(chatsController.chatCreate?.chat!.chatId);
                    },
                    child: Icon(
                      Icons.send,
                      color: Colors.white,
                      size: 18,
                    ),
                    backgroundColor: AppThemeColors.primaryColor,
                    elevation: 0,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
