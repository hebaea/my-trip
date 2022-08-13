class MessageCreateResponse {
  Message? message;

  MessageCreateResponse({this.message});

  MessageCreateResponse.fromJson(Map<String, dynamic> json) {
    message =
        json['message'] != null ? Message.fromJson(json['message']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (message != null) {
      data['message'] = message!.toJson();
    }
    return data;
  }
}

class Message {
  int? chatId;
  String? from;
  String? text;
  String? updatedAt;
  String? createdAt;
  int? id;

  Message(
      {this.chatId,
      this.from,
      this.text,
      this.updatedAt,
      this.createdAt,
      this.id});

  Message.fromJson(Map<String, dynamic> json) {
    chatId = json['chat_id'];
    from = json['from'];
    text = json['text'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['chat_id'] = chatId;
    data['from'] = from;
    data['text'] = text;
    data['updated_at'] = updatedAt;
    data['created_at'] = createdAt;
    data['id'] = id;
    return data;
  }
}
