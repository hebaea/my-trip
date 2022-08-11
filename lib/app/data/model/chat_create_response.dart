class ChatCreateResponse {
  Chat? chat;

  ChatCreateResponse({this.chat});

  ChatCreateResponse.fromJson(Map<String, dynamic> json) {
    chat = json['chat'] != null ? Chat.fromJson(json['chat']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (chat != null) {
      data['chat'] = chat!.toJson();
    }
    return data;
  }
}

class Chat {
  int? hostId;
  int? guestId;
  String? updatedAt;
  String? createdAt;
  int? chatId;

  Chat(
      {this.hostId, this.guestId, this.updatedAt, this.createdAt, this.chatId});

  Chat.fromJson(Map<String, dynamic> json) {
    hostId = json['host_id'];
    guestId = json['guest_id'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    chatId = json['chat_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['host_id'] = hostId;
    data['guest_id'] = guestId;
    data['updated_at'] = updatedAt;
    data['created_at'] = createdAt;
    data['chat_id'] = chatId;
    return data;
  }
}
