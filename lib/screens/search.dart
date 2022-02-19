import 'package:flutter/material.dart';
import 'package:ruang_ilmu/models/book.dart';
import 'package:ruang_ilmu/widgets/vertical_book_list.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  Iterable<Book> _books = [];

  void filteringBooks(String keyword) {
    Iterable<Book> filteredBooks = [];

    if (keyword.trim().isNotEmpty) {
      filteredBooks = bookList
          .where(
              (book) => book.name.toLowerCase().contains(keyword.toLowerCase()))
          .take(10);
    }

    setState(() {
      _books = filteredBooks;
    });
  }

  Widget searchBar(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: <Widget>[
          InkWell(
            child: const Icon(Icons.arrow_back),
            onTap: () => Navigator.pop(context),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: TextField(
              onChanged: (keyword) {
                filteringBooks(keyword);
              },
              autofocus: true,
              cursorHeight: 21,
              cursorColor: Colors.grey[800],
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 16,
                ),
                filled: true,
                fillColor: Colors.grey[300],
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(50),
                ),
                prefixIcon: Icon(Icons.search, color: Colors.grey[600]),
                hintText: 'Cari judul buku di sini ....',
                hintStyle: TextStyle(color: Colors.grey[600]),
              ),
            ),
          ),
        ],
      ),
    );
  }

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
                searchBar(context),
                const SizedBox(height: 16),
                Expanded(child: VerticalBookList(books: _books)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
