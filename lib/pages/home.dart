import 'package:flutter/material.dart';
import 'package:typist/components/message_card.dart';
import 'package:typist/components/system_floating_button.dart';
import 'package:typist/components/textbox.dart';

// メッセージイベントの構造体
class MessageEvent {
  const MessageEvent({
    required this.label,
    required this.posX,
    required this.posY,
    required this.width,
    required this.height,
    required this.message,
  });

  final String label;
  final int posX;
  final int posY;
  final int width;
  final int height;
  final String message;
}

// 閉じるボタン
class CloseButton extends StatelessWidget {
  const CloseButton({super.key});

  @override
  Widget build(BuildContext context) {
    return (FloatingActionButton(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      onPressed: () {
        Navigator.pop(context);
      },
      child: const Icon(Icons.close),
    ));
  }
}

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
            width: 500,
            padding: const EdgeInsets.all(12),
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
                const SizedBox(width: 32),
                Container(
                    padding: const EdgeInsets.all(8),
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
                        )
                      ],
                    )),
              ],
            ),
          )),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _Home();
}

class _Home extends State<Home> {
  List<MessageEvent> events = [
    const MessageEvent(
      label: "イーハトーヴの青い霧。中央駅の華麗なるアーチ",
      posX: 100,
      posY: 100,
      width: 100,
      height: 100,
      message: "イーハトーヴの青い霧。中央駅の華麗なるアーチ。白い蒸気をあげながらプラットフォームに",
    ),
    const MessageEvent(
      label: "イーハトーヴの青い霧。中央駅の華麗なるアーチ",
      posX: 100,
      posY: 100,
      width: 100,
      height: 100,
      message: "イーハトーヴの青い霧。中央駅の華麗なるアーチ。白い蒸気をあげながらプラットフォームに",
    ),
  ];

  // メッセージイベントの追加
  void addMessageEvent(MessageEvent event) {
    events.add(event);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            margin: const EdgeInsets.all(24),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  for (final card in events)
                    MessageCard(
                        label: card.label,
                        overview: card.message,
                        edit: () {
                          showDialog<String>(
                              context: context,
                              builder: (BuildContext context) =>
                                  const MessageEventDialog());
                        },
                        trash: () {
                          setState(() {
                            events.remove(card);
                          });
                        }),
                  const SizedBox(height: 8),
                  SystemFloatingButton(
                    hero: "add",
                    onPressed: () {
                      setState(() {
                        addMessageEvent(
                          const MessageEvent(
                            label: "イーハトーヴの青い霧。中央駅の華麗なるアーチ",
                            posX: 100,
                            posY: 100,
                            width: 100,
                            height: 100,
                            message:
                                "イーハトーヴの青い霧。中央駅の華麗なるアーチ。白い蒸気をあげながらプラットフォームに",
                          ),
                        );
                      });
                    },
                    icons: Icons.add_outlined,
                  ),
                ],
              ),
            )),

        // 画面右下の、ファイル操作周り
        floatingActionButton: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SystemFloatingButton(
                hero: "download",
                onPressed: () {},
                icons: Icons.file_download_outlined),
            const SizedBox(height: 16),
            SystemFloatingButton(
                hero: "upload",
                onPressed: () {},
                icons: Icons.upload_file_outlined),
            const SizedBox(height: 16),
            SystemFloatingButton(
                hero: "new file",
                onPressed: () {},
                icons: Icons.note_add_outlined),
          ],
        ));
  }
}
