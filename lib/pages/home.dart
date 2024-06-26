import 'dart:js_util';

import 'package:csv/csv.dart';
import 'package:file_picker/_internal/file_picker_web.dart';
import 'package:flutter/material.dart';
import 'package:typist/components/message_card.dart';
import 'package:typist/components/system_floating_button.dart';
import 'package:typist/components/message_event_dialog.dart';
import 'package:typist/consts/message_event.dart';
import 'package:typist/pages/settings.dart';
import 'package:typist/consts/messages.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:html' as html;
import 'dart:convert';
import 'package:typist/consts/setting.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _Home();
}

class _Home extends State<Home> {
  Messages messages = Messages.instance;
  Setting setting = Setting.instance;

  // メッセージイベントの追加
  void addMessageEvent(MessageEvent event) {
    messages.add(event);
  }

  // ファイルの読み込み
  Future<void> loadFile() async {
    FilePickerResult? result = await FilePickerWeb.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['csv'],
        allowMultiple: false,
        withData: true);

    if (result != null) {
      PlatformFile file = result.files.first;
      String s = utf8.decode(file.bytes!);
      debugPrint(s);
    } else {
      // User canceled the picker
    }
  }

  // ファイルの保存
  Future<void> saveFile() async {
    final header = ["label", "pos_x", "pos_y", "size_x", "size_y", "message"];
    final rows = messages.events.map((u) => u.toCSVFormat()).toList();
    final csv = const ListToCsvConverter().convert(
      [header, ...rows],
    );

    html.AnchorElement(href: "data:text/plain;charset=utf-8,$csv")
      ..setAttribute("download", "${setting.fileName}.csv")
      ..click();
  }

  // ダイアログの表示
  Future<void> showEditDialog() async {}

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
                        overview: card.message.replaceAll("\n", " "),
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
                onPressed: () {
                  saveFile();
                },
                icons: Icons.file_download_outlined),
            const SizedBox(height: 16),
            SystemFloatingButton(
                hero: "upload",
                onPressed: () {
                  loadFile();
                },
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
