class ChatModel {
  final String name;
  final String avatarUrl;
  final String message;

  ChatModel({
    required this.name,
    required this.message,
    required this.avatarUrl,
  });

  //写了一个工厂方法，功能是用map创建chatModel
  factory ChatModel.fromMap(Map map){
    return ChatModel(name: map["name"], message: map["message"], avatarUrl:
    map["avatarUrl"]);
  }
}
