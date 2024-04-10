import 'package:flutter/material.dart';
import 'package:typist/components/textbox.dart';
import 'package:typist/components/multiline_textbox.dart';

class MessageEventDialog extends StatefulWidget {
  const MessageEventDialog({super.key});

  @override
  State<MessageEventDialog> createState() => _MessageEventDialog();
}

class _MessageEventDialog extends State<MessageEventDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: 550,
            padding: const EdgeInsets.all(12),
            child: SingleChildScrollView(
                child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                          child: Text("メッセージイベントを登録",
                              style: TextStyle(
                                  fontSize: 26, fontWeight: FontWeight.bold))),
                      Expanded(child: SizedBox()),
                      Align(
                          alignment: Alignment.topRight, child: CloseButton()),
                    ]),
                Container(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      children: [
                        Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const SizedBox(
                                  width: 72,
                                  child: Text("Label",
                                      style: TextStyle(
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold))),
                              const SizedBox(width: 4),
                              TextBox(
                                  hint: "Name of the event", onChanged: (v) {})
                            ]),
                        const SizedBox(height: 8),
                        Row(children: [
                          const SizedBox(
                              width: 72,
                              child: Text("Pos",
                                  style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold))),
                          const SizedBox(width: 4),
                          TextBox(hint: "x", onChanged: (v) {}),
                          const SizedBox(width: 8),
                          TextBox(hint: "y", onChanged: (v) {}),
                        ]),
                        const SizedBox(height: 8),
                        Row(children: [
                          const SizedBox(
                              width: 72,
                              child: Text("Size",
                                  style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold))),
                          const SizedBox(width: 4),
                          TextBox(hint: "width", onChanged: (v) {}),
                          const SizedBox(width: 8),
                          TextBox(hint: "height", onChanged: (v) {}),
                        ]),
                        const SizedBox(height: 12),
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Text("Message",
                              style: TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.bold)),
                        ),
                        const SizedBox(height: 12),
                        Row(children: [
                          MultilineTextBox(
                            hintText: "messages...",
                            onChanged: (v) {},
                          ),
                        ]),
                      ],
                    )),
                const SizedBox(height: 12),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                    ),
                    onPressed: () {},
                    child: const SizedBox(
                        height: 45,
                        child: Center(
                            child: Text("Add",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white)))))
              ],
            )),
          )),
    );
  }
}
