import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:my_trip/app/core/theme/color_theme.dart';
import 'package:my_trip/app/global_widgets/default_text.dart';
import 'package:my_trip/app/modules/chats/views/chatPage.dart..dart';
import 'package:my_trip/app/modules/chats/views/conversationList.dart';
import '../controllers/chats_controller.dart';

class ChatsView extends GetView<ChatsController> {
  const ChatsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const DefaultText(
          'الدردشات',
          color: AppThemeColors.primaryPureWhite,
        ),
        centerTitle: true,
      ),
      body:
          // ChatPage()
          SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ListView.builder(
              itemCount: controller.chatIndex?.chats!.length,
              shrinkWrap: true,
              padding: const EdgeInsets.only(top: 16),
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return ConversationList(
                  // name: chatUsers[index].name,
                  // messageText: chatUsers[index].messageText,
                  // imageUrl: chatUsers[index].imageURL,
                  // time: chatUsers[index].time,
                  time: controller.chatIndex!.chats![index].createdAt,
                  isMessageRead: (index == 0 || index == 3) ? true : false,
                );
              },
            ),
          ],
        ),
      ),

      //////////////////////////////////////// empty state
      // Padding(
      //   padding: EdgeInsets.symmetric(horizontal: 10.0.w),
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     crossAxisAlignment: CrossAxisAlignment.center,
      //     children: [
      //       SvgPicture.asset(
      //         "assets/images/empty_chats.svg",
      //         height: 110.h,
      //         width: 120.w,
      //       ),
      //       SizedBox(
      //         height: 20.h,
      //       ),
      //       DefaultText(
      //         "سجل الدردشات الخاص بك فارغ",
      //         fontSize: 16.sp,
      //         fontWeight: FontWeight.bold,
      //       ),
      //       SizedBox(
      //         height: 3.h,
      //       ),
      //       const DefaultText(
      //         "عند تواصلك مع أحد الوجهات ستكون المحادثات الخاصة بك موجودة هنا",
      //         color: AppThemeColors.grayPrimary400,
      //         textAlign: TextAlign.center,
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}
