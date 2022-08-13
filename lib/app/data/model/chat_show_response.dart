import 'package:my_trip/app/data/model/message_create_response.dart';

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
  List<Message>? messages;
  Destination? destination;

  Chat(
      {this.chatId,
      this.hostId,
      this.guestId,
      this.createdAt,
      this.updatedAt,
      this.messages,
      this.destination});

  Chat.fromJson(Map<String, dynamic> json) {
    chatId = json['chat_id'];
    hostId = json['host_id'];
    guestId = json['guest_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['messages'] != null) {
      messages = <Message>[];
      json['messages'].forEach((v) {
        messages!.add(Message.fromJson(v));
      });
    }
    destination = json['destination'] != null
        ? Destination.fromJson(json['destination'])
        : null;
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
    if (destination != null) {
      data['destination'] = destination!.toJson();
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

class Destination {
  int? destinationId;
  String? destinationName;
  int? hostId;
  int? categoryId;
  int? cityId;
  String? destinationAddress;
  String? destinationImg;
  bool? destinationStauts;
  String? createdAt;
  String? updatedAt;
  String? destinationEvaluation;

  Destination(
      {this.destinationId,
      this.destinationName,
      this.hostId,
      this.categoryId,
      this.cityId,
      this.destinationAddress,
      this.destinationImg,
      this.destinationStauts,
      this.createdAt,
      this.updatedAt,
      this.destinationEvaluation});

  Destination.fromJson(Map<String, dynamic> json) {
    destinationId = json['destination_id'];
    destinationName = json['destination_name'];
    hostId = json['host_id'];
    categoryId = json['category_id'];
    cityId = json['city_id'];
    destinationAddress = json['destination_address'];
    destinationImg = json['destination_img'];
    destinationStauts = json['destination_stauts'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    destinationEvaluation = json['destination_evaluation'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['destination_id'] = destinationId;
    data['destination_name'] = destinationName;
    data['host_id'] = hostId;
    data['category_id'] = categoryId;
    data['city_id'] = cityId;
    data['destination_address'] = destinationAddress;
    data['destination_img'] = destinationImg;
    data['destination_stauts'] = destinationStauts;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['destination_evaluation'] = destinationEvaluation;
    return data;
  }
}
