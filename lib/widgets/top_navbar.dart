import 'package:flutter/material.dart';

Widget topNavbar(BuildContext context, {required String screenName}) {
  return Stack(
    alignment: AlignmentDirectional.centerStart,
    children: <Widget>[
      InkWell(
        child: const Icon(Icons.arrow_back),
        onTap: () => Navigator.pop(context),
      ),
      Center(
        child: Text(
          screenName,
          style: const TextStyle(
            fontFamily: 'Rubik',
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ],
  );
}
