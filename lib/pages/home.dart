import 'package:flutter/material.dart';
import 'package:typist/components/message_card.dart';
import 'package:typist/components/system_floating_button.dart';

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
                        overview: card.label,
                        edit: () {},
                        trash: () {}),
                  const SizedBox(height: 8),
                  SystemFloatingButton(
                      hero: "add", onPressed: () {}, icons: Icons.add_outlined),
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
