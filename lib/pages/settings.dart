import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:typist/components/textbox.dart';
import 'package:typist/consts/setting.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _Settings();
}

class _Settings extends State<Settings> {
  Setting setting = Setting.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            margin: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                    alignment: Alignment.topLeft,
                    child: BackButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    )),
                const SizedBox(height: 32),
                const Text("File Name",
                    style:
                        TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                const SizedBox(height: 12),
                SizedBox(
                    width: 400,
                    child: TextBox(
                      hint: "fileName",
                      onChanged: (v) {
                        setting.setFileName(v);
                      },
                    )),
                const Text("Num of chars",
                    style:
                        TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                const SizedBox(height: 12),
                SizedBox(
                    width: 400,
                    child: TextBox(
                      hint: "0",
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      onChanged: (v) {
                        setting.setNumOfChar(int.parse(v));
                      },
                    )),
                const SizedBox(height: 32),
                const Text("Num of lines",
                    style:
                        TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                const SizedBox(height: 12),
                SizedBox(
                    width: 400,
                    child: TextBox(
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      hint: "0",
                      onChanged: (v) {
                        setting.setNumOfLine(int.parse(v));
                      },
                    )),
              ],
            )));
  }
}
