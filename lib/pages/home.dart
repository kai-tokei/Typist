import 'package:flutter/material.dart';
import 'package:typist/components/message_card.dart';
import 'package:typist/components/system_floating_button.dart';
import 'package:typist/components/message_event_dialog.dart';
import 'package:typist/consts/message_event.dart';
import 'package:typist/pages/settings.dart';
import 'package:typist/consts/messages.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _Home();
}

class _Home extends State<Home> {
  //List<MessageEvent> events = [];
  Messages messages = Messages.instance;

  // メッセージイベントの追加
  void addMessageEvent(MessageEvent event) {
    messages.add(event);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            margin: const EdgeInsets.all(24),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  for (final card in messages.events)
                    MessageCard(
                        label: card.label,
                        overview: card.message,
                        edit: () async {
                          await showDialog<MessageEvent>(
                              context: context,
                              builder: (BuildContext context) =>
                                  MessageEventDialog(
                                    messageEvent: card,
                                  ));
                          setState(() {});
                        },
                        trash: () {
                          setState(() {
                            messages.remove(card);
                          });
                        }),
                  const SizedBox(height: 8),
                  SystemFloatingButton(
                    hero: "add",
                    onPressed: () async {
                      await showDialog<String>(
                          context: context,
                          builder: (BuildContext context) =>
                              const MessageEventDialog());
                      setState(() {});
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
                hero: "settings",
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const Settings()));
                },
                icons: Icons.settings_outlined),
            const SizedBox(height: 16),
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
