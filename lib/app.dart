import 'package:flutter/material.dart';
import 'package:typist/pages/home.dart';

class TypistApp extends StatelessWidget {
  const TypistApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Typist',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: const ColorScheme.light(
          primary: Colors.black, // 主要な色
          secondary: Colors.grey, // セカンダリ色
          surface: Colors.white, // 表面色
          background: Colors.white, // 背景色
          error: Colors.red, // エラー色
          onPrimary: Colors.white, // 主要な色の上でのテキスト色
          onSecondary: Colors.black,
          onSurface: Colors.black,
          onBackground: Colors.black,
          onError: Colors.red, // エラー色の上でのテキスト色
          brightness: Brightness.light, // 明るさ
        ),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.dark(
          primary: Colors.grey.shade800, // 主要な色
          secondary: Colors.white, // セカンダリ色
          surface: const Color(0xFF363636), // 表面色
          error: Colors.red, // エラー色
          onPrimary: Colors.white, // 主要な色の上でのテキスト色
          onSecondary: Colors.white,
          onSurface: Colors.white,
          onBackground: Colors.white,
          background: const Color(0xff1E1E1E),
          onError: Colors.red, // エラー色の上でのテキスト色
        ),
        useMaterial3: true,
      ),
      home: const Home(),
    );
  }
}
