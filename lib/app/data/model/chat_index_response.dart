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

  Chats({this.chatId, this.hostId, this.guestId, this.createdAt});

  Chats.fromJson(Map<String, dynamic> json) {
    chatId = json['chat_id'];
    hostId = json['host_id'];
    guestId = json['guest_id'];
    createdAt = json['Created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['chat_id'] = chatId;
    data['host_id'] = hostId;
    data['guest_id'] = guestId;
    data['Created_at'] = createdAt;
    return data;
  }
}
