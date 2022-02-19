import 'package:flutter/material.dart';
import 'package:ruang_ilmu/screens/home.dart';

void main() => runApp(const MainApp());

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: MaterialApp(
        title: 'Ruang Ilmu',
        theme: ThemeData(
          fontFamily: 'Karla',
          primarySwatch: Colors.orange,
        ),
        home: Home(),
      ),
    );
  }
}
