class ChatIndexResponse {
  List<Chats>? chats;

  ChatIndexResponse({this.chats});

  ChatIndexResponse.fromJson(Map<String, dynamic> json) {
    if (json['chats'] != null) {
      chats = <Chats>[];
      json['chats'].forEach((v) {
        chats!.add(Chats.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (chats != null) {
      data['chats'] = chats!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Chats {
  int? chatId;
  int? hostId;
  int? guestId;
  String? createdAt;
  String? destinationName;
  String? destinationImg;

  Chats({this.chatId, this.hostId, this.guestId, this.createdAt});

  Chats.fromJson(Map<String, dynamic> json) {
    chatId = json['chat_id'];
    hostId = json['host_id'];
    guestId = json['guest_id'];
    createdAt = json['Created_at'];
    destinationName = json['destination_name'];
    destinationImg = json['destination_img'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['chat_id'] = chatId;
    data['host_id'] = hostId;
    data['guest_id'] = guestId;
    data['Created_at'] = createdAt;
    data['destination_name'] = destinationName;
    data['destination_img'] = destinationImg;
    return data;
  }
}
