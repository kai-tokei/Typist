import 'package:flutter/material.dart';
import 'package:typist/components/message_card.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _Home();
}

class SystemFloatingButton extends StatelessWidget {
  const SystemFloatingButton({
    super.key,
    required this.hero,
    required this.onPressed,
    required this.icons,
  });

  final String hero;
  final VoidCallback onPressed;
  final IconData icons;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.fromLTRB(0, 8, 0, 8),
        child: FloatingActionButton(
          onPressed: onPressed,
          heroTag: hero,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
          child: Icon(icons, size: 30),
        ));
  }
}

class _Home extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Container(
                margin: const EdgeInsets.all(32),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      MessageCard(
                          label: "イーハトーヴの青い霧。中央駅の",
                          overview:
                              "イーハトーヴの青い霧。中央駅の華麗なる緑のアーチイーハトーヴの青い霧。中央駅の華麗なる緑のアーチ",
                          edit: () {},
                          trash: () {})
                    ],
                  ),
                ))),
        floatingActionButton: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SystemFloatingButton(
                hero: "download",
                onPressed: () {},
                icons: Icons.file_download_outlined),
            SystemFloatingButton(
                hero: "upload",
                onPressed: () {},
                icons: Icons.upload_file_outlined),
            SystemFloatingButton(
                hero: "new file",
                onPressed: () {},
                icons: Icons.note_add_outlined),
          ],
        ));
  }
}
