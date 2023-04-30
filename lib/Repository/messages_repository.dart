class MessagesRepository {
  final List<Message> messages = [
    Message("Hi", "Ali", DateTime.now().subtract(const Duration(minutes: 1))),
    Message("how are you", "Ayşe",
        DateTime.now().subtract(const Duration(minutes: 2))),
    Message("I am fine thanks", "Ali",
        DateTime.now().subtract(const Duration(minutes: 3))),
  ];
}

class Message {
  String text;
  String sender;
  DateTime time;

  Message(this.text, this.sender, this.time);
}
