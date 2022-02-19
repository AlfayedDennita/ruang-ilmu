import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:ruang_ilmu/utils/rupiah_currency.dart';
import 'package:ruang_ilmu/models/book.dart';
import 'package:ruang_ilmu/screens/detail.dart';

class VerticalBookList extends StatefulWidget {
  final Iterable<Book> books;

  const VerticalBookList({Key? key, required this.books}) : super(key: key);

  @override
  _VerticalBookListState createState() => _VerticalBookListState();
}

class _VerticalBookListState extends State<VerticalBookList> {
  @override
  Widget build(BuildContext context) {
    List<Book> books = widget.books.toList();

    return ListView.builder(
      itemCount: books.length,
      itemBuilder: (context, index) {
        final Book book = books[index];

        return InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return Detail(book: book);
            })).then((_) {
              setState(() {});
            });
          },
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: Image.asset(
                    'images/books/${book.image}',
                    height: 100,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: Colors.orange,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          rupiah(book.price),
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        book.name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'oleh ${book.author}',
                        style: TextStyle(
                          color: Colors.grey[400],
                          fontStyle: FontStyle.italic,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4),
                      RatingBarIndicator(
                        rating: book.rating,
                        itemSize: 12,
                        itemBuilder: (context, index) =>
                            const Icon(Icons.star, color: Colors.orange),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
