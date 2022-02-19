import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:ruang_ilmu/utils/rupiah_currency.dart';
import 'package:ruang_ilmu/models/book.dart';
import 'package:ruang_ilmu/widgets/top_navbar.dart';

class Detail extends StatefulWidget {
  final Book book;

  const Detail({Key? key, required this.book}) : super(key: key);

  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  late int qtyCounter = widget.book.qtyInBasket;

  Widget saveButton(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          widget.book.isOnPrivateShelf = !widget.book.isOnPrivateShelf;
        });

        String toastMessage =
            widget.book.isOnPrivateShelf ? 'ditambahkan ke' : 'dihapus dari';

        Fluttertoast.showToast(msg: 'Buku berhasil $toastMessage rak pribadi');
      },
      child: Icon(
        widget.book.isOnPrivateShelf ? Icons.bookmark : Icons.bookmark_border,
        size: 32,
        color: Colors.orange,
      ),
    );
  }

  Widget addToBasket(BuildContext context) {
    String buttonText() {
      String buttonText;

      if (widget.book.qtyInBasket > 0 && qtyCounter > 0) {
        buttonText = 'Perbarui Jumlah Buku';
      } else if (widget.book.qtyInBasket > 0 && qtyCounter == 0) {
        buttonText = 'Hapus dari Keranjang';
      } else {
        buttonText = 'Tambah ke Keranjang';
      }

      return buttonText;
    }

    return Row(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade200),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: <Widget>[
              InkWell(
                child: Icon(Icons.remove, color: Colors.grey[700]),
                onTap: () {
                  setState(() {
                    if (qtyCounter > 0) {
                      qtyCounter--;
                    }
                  });
                },
              ),
              const SizedBox(width: 8),
              SizedBox(
                width: 8,
                child: Text(
                  qtyCounter.toString(),
                  style: const TextStyle(fontSize: 16),
                ),
              ),
              const SizedBox(width: 8),
              InkWell(
                child: Icon(Icons.add, color: Colors.grey[700]),
                onTap: () {
                  setState(() {
                    if (qtyCounter < 9) {
                      qtyCounter++;
                    }
                  });
                },
              ),
            ],
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: ElevatedButton(
            child: Text(
              buttonText(),
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            onPressed: () {
              String toastMessage;

              if (widget.book.qtyInBasket == 0 && qtyCounter > 0) {
                toastMessage = 'Buku berhasil dimasukkan ke dalam keranjang';
              } else if (qtyCounter > 0) {
                toastMessage = 'Jumlah buku di keranjang berhasil diperbarui';
              } else if (widget.book.qtyInBasket == 0 && qtyCounter == 0) {
                toastMessage =
                    'Masukkan jumlah buku yang ingin dimasukkan ke dalam keranjang terlebih dahulu!';
              } else {
                toastMessage = 'Buku berhasil dihapus dari keranjang';
              }

              Fluttertoast.showToast(msg: toastMessage);

              setState(() {
                widget.book.qtyInBasket = qtyCounter;
              });
            },
          ),
        ),
      ],
    );
  }

  Widget bookImage(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 64, horizontal: 16),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 4),
              blurRadius: 8,
              color: Colors.grey.shade400,
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset('images/books/${widget.book.image}', height: 175),
        ),
      ),
    );
  }

  Widget bookDescription(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(32),
          topRight: Radius.circular(32),
        ),
      ),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      widget.book.name,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'oleh ${widget.book.author}',
                      style: TextStyle(color: Colors.grey[400]),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 32),
              saveButton(context),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: <Widget>[
              Expanded(
                child: Row(
                  children: <Widget>[
                    RatingBarIndicator(
                      rating: widget.book.rating,
                      itemSize: 16,
                      itemBuilder: (context, index) {
                        return const Icon(Icons.star, color: Colors.orange);
                      },
                    ),
                    const SizedBox(width: 6),
                    Text(
                      widget.book.rating.toString(),
                      style: const TextStyle(color: Colors.orange),
                    ),
                    const SizedBox(width: 6),
                    Text(
                      '(${widget.book.totalBuyers})',
                      style: TextStyle(color: Colors.grey[400]),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 16),
              Text(
                rupiah(widget.book.price),
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Container(
            constraints: const BoxConstraints(maxHeight: 135),
            child: Scrollbar(
              thickness: 2,
              radius: const Radius.circular(4),
              child: SingleChildScrollView(
                child: Text(
                  widget.book.description,
                  style: const TextStyle(height: 1.5),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          addToBasket(context),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height - 28,
            ),
            padding: const EdgeInsets.only(top: 32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  child: topNavbar(context, screenName: 'Detail Buku'),
                ),
                bookImage(context),
                bookDescription(context),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
