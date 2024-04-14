import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:typist/components/textbox.dart';
import 'package:typist/components/multiline_textbox.dart';
import 'package:typist/consts/message_event.dart';
import 'package:typist/consts/setting.dart';

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

  Setting setting = Setting.instance;

  // Addできるか判定
  bool propatiesOk() {
    bool sizeOk = w > 0 && h > 0;
    bool labelOk = label != "";
    bool messageOk = (message != "") &&
        messageJudge(
          message,
          numOfChars: setting.numOfChar,
          numOfLines: setting.numOfLine,
        );

    return sizeOk && labelOk && messageOk;
  }

  // メッセージスナックの制約に合致したテキストか判定
  bool messageJudge(
    String text, {
    int numOfChars = 18,
    int numOfLines = 2,
  }) {
    int enter = 0;
    int lineCounter = 0;
    for (int i = 0; i < text.length; i++) {
      lineCounter++;
      if (lineCounter > numOfChars) {
        return false;
      }
      if (text[i] == '\n') {
        enter++;
        if (enter > 2) {
          return false;
        }
        lineCounter = 0;
      }
      if (enter == 2 && lineCounter > 0) {
        enter = 0;
      }
    }
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
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              onChanged: (v) {
                                setState(() {
                                  if (v != "") {
                                    posX = int.parse(v);
                                  } else {
                                    posX = 0;
                                  }
                                });
                              }),
                          const SizedBox(width: 8),
                          TextBox(
                              hint: "y",
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              onChanged: (v) {
                                setState(() {
                                  if (v != "") {
                                    posY = int.parse(v);
                                  } else {
                                    posY = 0;
                                  }
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
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              onChanged: (v) {
                                setState(() {
                                  if (v != "") {
                                    w = int.parse(v);
                                  } else {
                                    w = 0;
                                  }
                                });
                              }),
                          const SizedBox(width: 8),
                          TextBox(
                              hint: "height",
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              onChanged: (v) {
                                setState(() {
                                  if (v != "") {
                                    h = int.parse(v);
                                  } else {
                                    h = 0;
                                  }
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
