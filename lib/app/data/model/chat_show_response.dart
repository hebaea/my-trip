class ChatShowResponse {
  Chat? chat;

  ChatShowResponse({this.chat});

  ChatShowResponse.fromJson(Map<String, dynamic> json) {
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
  int? chatId;
  int? hostId;
  int? guestId;
  String? createdAt;
  String? updatedAt;
  List<Messages>? messages;

  Chat(
      {this.chatId,
      this.hostId,
      this.guestId,
      this.createdAt,
      this.updatedAt,
      this.messages});

  Chat.fromJson(Map<String, dynamic> json) {
    chatId = json['chat_id'];
    hostId = json['host_id'];
    guestId = json['guest_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['messages'] != null) {
      messages = <Messages>[];
      json['messages'].forEach((v) {
        messages!.add(Messages.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['chat_id'] = chatId;
    data['host_id'] = hostId;
    data['guest_id'] = guestId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (messages != null) {
      data['messages'] = messages!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Messages {
  int? id;
  int? chatId;
  String? from;
  int? isRead;
  String? text;
  String? createdAt;
  String? updatedAt;

  Messages(
      {this.id,
      this.chatId,
      this.from,
      this.isRead,
      this.text,
      this.createdAt,
      this.updatedAt});

  Messages.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    chatId = json['chat_id'];
    from = json['from'];
    isRead = json['is_read'];
    text = json['text'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['chat_id'] = chatId;
    data['from'] = from;
    data['is_read'] = isRead;
    data['text'] = text;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
