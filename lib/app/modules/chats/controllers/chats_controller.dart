import 'dart:convert';
import 'package:get/get.dart';
import 'package:my_trip/app/core/utils/baseurl.dart';
import 'package:my_trip/app/data/model/chat_index_response.dart';
import 'package:http/http.dart' as http;

class ChatsController extends GetxController {
  ChatIndexResponse? chatIndex;
  var isDataLoading = false.obs;

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

  getChatIndex(int guestId) async {
    try {
      isDataLoading(true);

      http.Response response = await http.post(
        Uri.parse("$baseUrl/chat_create"),
        headers: {
          'Content-Type': 'application/json',
          'Accept': "application/json",
        },
        body: jsonEncode(<dynamic, dynamic>{
          "guest_id": guestId,
        }),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
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

  showChat(int chatId) async {
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
}
