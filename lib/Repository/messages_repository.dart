import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ogrenci_app/messages_page.dart';

class MessagesRepository extends ChangeNotifier {
  final List<Message> messages = [
    Message("Hi", "Ali", DateTime.now().subtract(const Duration(minutes: 1))),
    Message("how are you", "Ayşe",
        DateTime.now().subtract(const Duration(minutes: 2))),
    Message("I am fine thanks", "Ali",
        DateTime.now().subtract(const Duration(minutes: 3))),
  ];
}

final messageProvider = ChangeNotifierProvider((ref) {
  return MessagesRepository();
});

class NewMessageNumber extends StateNotifier<int> {
  NewMessageNumber(super.state);

  void reset() {
    state = 0;
  }
}

final newMessageNumberProvider =
    StateNotifierProvider<NewMessageNumber, int>((ref) {
  return NewMessageNumber(4);
});

class Message {
  String text;
  String sender;
  DateTime time;

  Message(this.text, this.sender, this.time);
}
