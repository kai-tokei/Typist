import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _Home();
}

class _Home extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[],
          ),
        ),
        floatingActionButton: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            FloatingActionButton(
              onPressed: () {},
              heroTag: "download",
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50)),
              child: const Icon(Icons.file_download_outlined, size: 30),
            ),
            const SizedBox(height: 12),
            FloatingActionButton(
              onPressed: () {},
              heroTag: "upload",
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50)),
              child: const Icon(Icons.upload_file_outlined, size: 30),
            ),
            const SizedBox(height: 12),
            FloatingActionButton(
              onPressed: () {},
              heroTag: "New file",
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50)),
              child: const Icon(Icons.note_add_outlined, size: 30),
            ),
          ],
        ));
  }
}
