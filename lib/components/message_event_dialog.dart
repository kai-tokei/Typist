import 'package:flutter/material.dart';
import 'package:typist/components/textbox.dart';
import 'package:typist/components/multiline_textbox.dart';
import 'package:typist/consts/message_event.dart';

class MessageEventDialog extends StatefulWidget {
  const MessageEventDialog({
    super.key,
    required this.onPressed,
  });

  final Function(MessageEvent) onPressed;

  @override
  State<MessageEventDialog> createState() => _MessageEventDialog();
}

class _MessageEventDialog extends State<MessageEventDialog> {
  String label = "";
  int posX = 0;
  int posY = 0;
  int w = 0;
  int h = 0;
  String message = "";

  // Addできるか判定
  bool propatiesOk() {
    bool sizeOk = w > 0 && h > 0;
    bool labelOk = label != "";
    bool messageOk = (message != "") && messageJudge(message);

    return sizeOk && labelOk && messageOk;
  }

  // メッセージスナックの制約に合致したテキストか判定
  bool messageJudge(String text) {
    return true;
  }

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
                                  hint: "Name of the event",
                                  onChanged: (v) {
                                    setState(() {
                                      label = v;
                                    });
                                  })
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
                          TextBox(
                              hint: "x",
                              onChanged: (v) {
                                setState(() {
                                  posX = int.parse(v);
                                });
                              }),
                          const SizedBox(width: 8),
                          TextBox(
                              hint: "y",
                              onChanged: (v) {
                                setState(() {
                                  posY = int.parse(v);
                                });
                              }),
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
                          TextBox(
                              hint: "width",
                              onChanged: (v) {
                                setState(() {
                                  w = int.parse(v);
                                });
                              }),
                          const SizedBox(width: 8),
                          TextBox(
                              hint: "height",
                              onChanged: (v) {
                                setState(() {
                                  h = int.parse(v);
                                });
                              }),
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
                            onChanged: (v) {
                              setState(() {
                                message = v;
                              });
                            },
                          ),
                        ]),
                      ],
                    )),
                const SizedBox(height: 12),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                    ),
                    onPressed: propatiesOk() ? () {} : null,
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
