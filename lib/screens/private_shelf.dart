import 'package:flutter/material.dart';
import 'package:ruang_ilmu/models/book.dart';
import 'package:ruang_ilmu/widgets/top_navbar.dart';
import 'package:ruang_ilmu/widgets/vertical_book_list.dart';

class PrivateShelf extends StatelessWidget {
  const PrivateShelf({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height - 28,
            padding: const EdgeInsets.only(top: 32),
            child: Column(
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  child: topNavbar(context, screenName: 'Rak Pribadi'),
                ),
                const SizedBox(height: 32),
                Expanded(
                  child: VerticalBookList(
                    books: bookList.where((book) => book.isOnPrivateShelf),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
