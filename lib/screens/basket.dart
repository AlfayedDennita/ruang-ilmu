import 'package:flutter/material.dart';
import 'package:ruang_ilmu/utils/rupiah_currency.dart';
import 'package:ruang_ilmu/models/book.dart';
import 'package:ruang_ilmu/widgets/top_navbar.dart';
import 'package:ruang_ilmu/screens/detail.dart';

class Basket extends StatefulWidget {
  const Basket({Key? key}) : super(key: key);

  @override
  _BasketState createState() => _BasketState();
}

class _BasketState extends State<Basket> {
  final Iterable<Book> _books = bookList.where((book) => book.qtyInBasket > 0);

  double grandTotal() {
    double grandTotal = 0;

    for (var book in _books) {
      grandTotal += book.totalPurchases();
    }

    return grandTotal;
  }

  Widget deleteBookConfirmation(BuildContext context, {required Book book}) {
    return AlertDialog(
      title: const Text(
        'Konfirmasi Hapus',
        style: TextStyle(fontFamily: 'Rubik'),
      ),
      content: Text(
        'Yakin ingin menghapus buku "${book.name}" dari keranjang?',
        style: const TextStyle(height: 1.25),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text(
            'Batal',
            style: TextStyle(color: Colors.black),
          ),
        ),
        TextButton(
          onPressed: () {
            setState(() {
              book.qtyInBasket = 0;
            });
            Navigator.pop(context);
          },
          child: const Text(
            'Hapus',
            style: TextStyle(color: Colors.red),
          ),
        ),
      ],
    );
  }

  Widget verticalBasketList(BuildContext context) {
    return ListView.builder(
      itemCount: _books.length,
      itemBuilder: (context, index) {
        final Book book = _books.toList()[index];

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
                      Text(
                        book.name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '${book.qtyInBasket} x ${rupiah(book.price)}',
                        style: const TextStyle(color: Colors.grey),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        rupiah(book.totalPurchases()),
                        style: const TextStyle(
                          fontSize: 20,
                          color: Colors.orange,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 16),
                InkWell(
                  child: const Icon(Icons.delete_outline, color: Colors.red),
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return deleteBookConfirmation(context, book: book);
                        });
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget grandTotalSection() {
    Widget grandTotalSection;

    if (_books.isEmpty) {
      grandTotalSection = const SizedBox();
    } else {
      grandTotalSection = Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'TOTAL',
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                  Text(
                    rupiah(grandTotal()),
                    style: const TextStyle(
                      fontSize: 22,
                      color: Colors.orange,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 16),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(125, 40),
              ),
              child: const Text(
                'Bayar',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      );
    }

    return grandTotalSection;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height - 28,
            padding: const EdgeInsets.symmetric(vertical: 32),
            child: Column(
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  child: topNavbar(context, screenName: 'Keranjang'),
                ),
                const SizedBox(height: 32),
                Expanded(child: verticalBasketList(context)),
                const SizedBox(height: 32),
                grandTotalSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
