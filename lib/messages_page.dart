import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ogrenci_app/Repository/messages_repository.dart';

class messagespage extends ConsumerStatefulWidget {
  const messagespage({Key? key}) : super(key: key);

  @override
  _messagespageState createState() => _messagespageState();
}

class _messagespageState extends ConsumerState<messagespage> {
  @override
  void initState() {
    Future.delayed(Duration.zero).then(
      (value) => ref.read(newMessageNumberProvider.notifier).reset(),
      // Sıfırlamayı şu anda değil biraz sonra yap - tavsiye edilen bu
    );

    // widget.messagesRepository.newMessagesNumber = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final messagesRepository = ref.watch(messageProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Messages"),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  reverse: true,
                  itemCount: messagesRepository.messages.length,
                  itemBuilder: (context, index) {
                    return MessageView(messagesRepository.messages[
                        messagesRepository.messages.length - index - 1]);
                  }),
            ),
            DecoratedBox(
              decoration: BoxDecoration(border: Border.all()),
              child: Row(
                children: [
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DecoratedBox(
                        decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(25.0),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: const TextField(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                            ),
                          ),
                        )),
                  )),
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: ElevatedButton(
                        onPressed: () {
                          print("Send");
                        },
                        child: Text("Send")),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MessageView extends StatelessWidget {
  final Message message;
  const MessageView(
    this.message, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: message.sender == "Ali"
          ? Alignment.centerRight
          : Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
        child: DecoratedBox(
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey, width: 2),
              color: Colors.orange.shade100,
              borderRadius: const BorderRadius.all(Radius.circular(15.0))),
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Text(message.text),
          ),
        ),
      ),
    );
  }
}
