import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_trip/app/core/theme/color_theme.dart';
import 'package:my_trip/app/global_widgets/default_text.dart';
import 'package:my_trip/app/modules/chats/controllers/chats_controller.dart';
import '../controllers/chat_details_page_controller.dart';

class ChatDetailsPageView extends GetView<ChatDetailsPageController> {
  final chatsController = Get.find<ChatsController>();

  ChatDetailsPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        // automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        flexibleSpace: SafeArea(
          child: Container(
            padding: const EdgeInsets.only(right: 16),
            child: Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(
                  width: 2,
                ),
                CircleAvatar(
                  backgroundImage: NetworkImage(
                      "https://mytrip.justhost.ly/${chatsController.chatsShow?.chat!.destination?.destinationImg}"),
                  maxRadius: 20,
                ),
                const SizedBox(
                  width: 12,
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        DefaultText(
                            "${chatsController.chatsShow?.chat!.destination?.destinationName}",
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                        const SizedBox(
                          height: 6,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Obx(
                  () => ListView.builder(
                    itemCount: chatsController.msgList.value.length,
                    // chatsController.chatsShow?.chat!.messages!.length,
                    shrinkWrap: true,
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Container(
                          padding: const EdgeInsets.only(
                              left: 16, right: 16, top: 10, bottom: 10),
                          child: Align(
                            alignment: (chatsController.msgList[index].from ==
                                    // chatsController
                                    //         .chatsShow?.chat!.messages![index].from ==
                                    "Host"
                                ? Alignment.topLeft
                                : Alignment.topRight),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: (chatsController.msgList[index].from ==
                                        // chatsController.chatsShow?.chat!
                                        //         .messages![index].from ==
                                        "Host"
                                    ? Colors.grey.shade200
                                    : AppThemeColors.primaryLightColor),
                              ),
                              padding: const EdgeInsets.all(16),
                              child: DefaultText(
                                  // "${chatsController.chatsShow?.chat!.messages![index].text}",
                                  '${chatsController.msgList[index].text}',
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
                const SizedBox(
                  height: 50,
                )
              ],
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
                    child: TextField(
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
                          chatsController.chatsShow?.chat?.chatId);
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
