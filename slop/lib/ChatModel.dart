class ChatModel{
  final String name;
  final String time;
  final String message;

  ChatModel({this.message,this.time,this.name});
}
List<ChatModel> dummydata=[
  new ChatModel(
    name: "Muhammad",
    message: "Asalaam Alaikum",
    time: "15:00",
  ),
];