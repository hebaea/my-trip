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
    controller.get();
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
          controller.chatsList.isNotEmpty
              ? Obx(()=>
                 SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        ListView.builder(
                          itemCount: controller.chatsList.length,
                          shrinkWrap: true,
                          padding: const EdgeInsets.only(top: 16),
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return ConversationList(
                              // name: controller.chatsList[index].hostId,
                              // messageText: chatUsers[index].messageText,
                              messageText: '' ,
                              name: 'كورنثيا باب افريقيا',
                              // controller.chatsList[index].hostId,//////////////////this one
                              //  imageUrl: controller.chatsList[index].hostId,
                               // time: chatUsers[index].time,
                               time: controller.chatsList[index].createdAt,
                              isMessageRead:
                                  (index == 0 || index == 3) ? true : false,
                            );
                          },
                        ),
                      ],
                    ),
                  ),
              )
              : Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        "assets/images/empty_chats.svg",
                        height: 110.h,
                        width: 120.w,
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      DefaultText(
                        "سجل الدردشات الخاص بك فارغ",
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                      ),
                      SizedBox(
                        height: 3.h,
                      ),
                      const DefaultText(
                        "عند تواصلك مع أحد الوجهات ستكون المحادثات الخاصة بك موجودة هنا",
                        color: AppThemeColors.grayPrimary400,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
    );
  }
}
