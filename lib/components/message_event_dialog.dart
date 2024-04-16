import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:typist/components/textbox.dart';
import 'package:typist/components/multiline_textbox.dart';
import 'package:typist/consts/message_event.dart';
import 'package:typist/consts/setting.dart';
import 'package:typist/consts/messages.dart';

class MessageEventDialog extends StatefulWidget {
  const MessageEventDialog(
      {super.key,
      this.messageEvent = const MessageEvent(
          label: "イベント名",
          posX: 0,
          posY: 0,
          width: 1,
          height: 1,
          message: "テキストを入力")});

  final MessageEvent messageEvent;

  @override
  State<MessageEventDialog> createState() => _MessageEventDialog();
}

class _MessageEventDialog extends State<MessageEventDialog> {
  late String label = widget.messageEvent.label;
  late int posX = widget.messageEvent.posX;
  late int posY = widget.messageEvent.posY;
  late int w = widget.messageEvent.width;
  late int h = widget.messageEvent.height;
  late String message = widget.messageEvent.message;

  // shared datas
  Setting setting = Setting.instance;
  Messages messages = Messages.instance;

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
    int emptyLines = 0;
    int numLines = 0;
    List<String> lines = text.split('\n');
    for (int i = 0; i < lines.length; i++) {
      if (lines[i].length > numOfChars) {
        return false;
      }
      if (lines[i] == "") {
        numLines = 0;
        emptyLines++;
      } else {
        numLines++;
        emptyLines = 0;
      }
      if (numLines > numOfLines) {
        return false;
      }
      if (emptyLines > 1) {
        return false;
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
                                  initialValue: label,
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
                              initialValue: posX.toString(),
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
                              initialValue: posY.toString(),
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
                              initialValue: w.toString(),
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
                              initialValue: h.toString(),
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
                            initialValue: message,
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
                    onPressed: propatiesOk()
                        ? () {
                            messages.remove(widget.messageEvent);
                            messages.add(MessageEvent(
                                label: label,
                                posX: posX,
                                posY: posY,
                                width: w,
                                height: h,
                                message: message));
                            Navigator.pop(context);
                          }
                        : null,
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
