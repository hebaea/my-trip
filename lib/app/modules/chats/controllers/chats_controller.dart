import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:my_trip/app/core/utils/baseurl.dart';
import 'package:my_trip/app/core/utils/custom_snackbar.dart';
import 'package:my_trip/app/data/model/chat_create_response.dart';
import 'package:my_trip/app/data/model/chat_index_response.dart';
import 'package:http/http.dart' as http;
import 'package:my_trip/app/data/model/chat_show_response.dart';
import 'package:my_trip/app/data/model/message_create_response.dart';
import 'package:my_trip/app/data/model/message_from_backend.dart';
import 'package:my_trip/app/routes/app_pages.dart';

class ChatsController extends GetxController {
  ChatIndexResponse? chatIndex;
  ChatCreateResponse? chatCreate;
  MessageCreateResponse? messageCreate;
  Message? message;

  var chatsList = <Chats>[].obs;
  var isDataLoading = false.obs;
  final storage = GetStorage();
  ChatShowResponse? chatsShow;

  // var msgList = <MessageCreateResponse>[].obs;
  Message? msg;
  var msgList = <Message>[].obs;

  TextEditingController msgController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  createChat(int guestId, int? hostId) async {
    try {
      isDataLoading(true);

      http.Response response = await http.post(
        Uri.parse("$baseUrl/chat_create"),
        headers: {
          'Content-Type': 'application/json',
          'Accept': "application/json",
        },
        body: jsonEncode(<dynamic, dynamic>{
          "host_id": hostId,
          "guest_id": guestId,
        }),
      );
      // var result = await json.decode(response.body);
      print(
          "----------------create chat--- state ${response.statusCode} ---------------------- ");
      print("------------------- res ${response.body} ---------------------- ");
      print("host id $hostId");
      print("guest id $guestId");
      if (response.statusCode == 200 || response.statusCode == 201) {
        print("chat created successfully ");
        //  ChatCreateResponse? chatCreate;
        var result = jsonDecode(response.body);
        chatCreate = ChatCreateResponse.fromJson(result);

        print(
            "============chatCreate===== ${chatCreate?.chat?.chatId.toString()}");
        await showChat(chatCreate?.chat!.chatId);

        return chatCreate;
      } else if (response.statusCode == 400) {
        MessageFromBackend? messageFromBackend;
        var result = jsonDecode(response.body);
        messageFromBackend = MessageFromBackend.fromJson(result);
        return customSnackbar(
            "إنشاء محادثة", messageFromBackend.message, "error");
      } else {
        return null;
      }
    } catch (e) {
      print('error while create chat $e');
    } finally {
      isDataLoading(false);
    }
  }

  showChat(int? chatId) async {
    try {
      isDataLoading(true);

      http.Response response = await http.get(
        Uri.parse("$baseUrl/chat_show/$chatId"),
        headers: {
          'Content-Type': 'application/json',
          'Accept': "application/json",
        },
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        //ChatShowResponse ? chatShow;
        var result = jsonDecode(response.body);
        chatsShow = ChatShowResponse.fromJson(result);
        print(
            "----------------------------------- HEre Message -----------------------");
        print("------------result---------$result---------");
        if (chatsShow?.chat?.messages != null) {
          var messages = chatsShow?.chat?.messages?.toList();
          msgList.clear();
          print("messages ==================");
          print(messages?.length);
          msgList.addAll(messages!);
        }

        Get.toNamed(Routes.CHAT_DETAILS_PAGE);
      } else if (response.statusCode == 400) {}
      {
        return null;
      }
    } catch (e) {
      print('error while get chat show $e');
    } finally {
      isDataLoading(false);
    }
  }

  createMessage(int? chatId) async {
    try {
      isDataLoading(true);

      http.Response response = await http.post(
        Uri.parse("$baseUrl/message_create"),
        headers: {
          'Content-Type': 'application/json',
          'Accept': "application/json",
        },
        body: jsonEncode(
            <dynamic, dynamic>{"chat_id": chatId, "text": msgController.text}),
      );
      var result = await json.decode(response.body);
      print(
          "----------------create msg--- state ${response.statusCode} ---------------------- ");
      print("------------------- res ${result} ---------------------- ");
      print("chat id $chatId");

      if (response.statusCode == 200 || response.statusCode == 201) {
        var result = jsonDecode(response.body);
        messageCreate = MessageCreateResponse.fromJson(result);

        if (messageCreate?.message != null) {
          msgList.add(messageCreate!.message!);
        }
        msgController.text = '';
      } else {
        return null;
      }
    } catch (e) {
      print('error while create Message $e');
    } finally {
      isDataLoading(false);
    }
  }

  get() async {
    print("=============== HERE Get ======================");
    await getChatIndex();
  }

  getChatIndex() async {
    try {
      var guestId = storage.read('id');

      isDataLoading(true);

      http.Response response = await http.post(
        Uri.parse("$baseUrl/chat_index"),
        headers: {
          'Content-Type': 'application/json',
          'Accept': "application/json",
        },
        body: jsonEncode(<dynamic, dynamic>{
          "guest_id": guestId,
        }),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        var result = jsonDecode(response.body);
        chatIndex = ChatIndexResponse.fromJson(result);
        print("------ $result------------------");
        chatsList.clear();
        chatsList.addAll(chatIndex!.chats!.toList());
      } else if (response.statusCode == 400) {}
      {
        return null;
      }
    } catch (e) {
      print('error while get chat index $e');
    } finally {
      isDataLoading(false);
    }
  }
}
