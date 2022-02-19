import 'package:flutter/material.dart';
import 'package:ruang_ilmu/models/book.dart';
import 'package:ruang_ilmu/screens/pages.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  final Widget appTitle = Container(
    margin: const EdgeInsets.symmetric(horizontal: 16),
    child: Row(
      children: const <Widget>[
        Icon(Icons.style, color: Colors.orange),
        SizedBox(width: 8),
        Text(
          'RUANG ILMU',
          style: TextStyle(
            fontFamily: 'Rubik',
            color: Colors.orange,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ),
  );
  final Widget welcomingHeader = Container(
    margin: const EdgeInsets.symmetric(horizontal: 16),
    child: const Text(
      'Ingin baca buku apa hari ini?',
      style: TextStyle(
        fontFamily: 'Rubik',
        fontSize: 28,
        fontWeight: FontWeight.bold,
      ),
    ),
  );

  Widget searchBar(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: TextField(
        readOnly: true,
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return const Search();
          }));
        },
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
    );
  }

  Widget popularBook(BuildContext context) {
    Book popularBook = bookList.reduce((current, next) {
      return current.totalBuyers > next.totalBuyers ? current : next;
    });

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          child: const Text(
            'Paling banyak diminati',
            style: TextStyle(
              fontFamily: 'Rubik',
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 16),
        InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return Detail(book: popularBook);
            }));
          },
          child: Container(
            padding: const EdgeInsets.all(16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    'images/books/${popularBook.image}',
                    height: 150,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        popularBook.name,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'oleh ${popularBook.author}',
                        style: TextStyle(
                          color: Colors.grey[400],
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        popularBook.description,
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget bookshelf(BuildContext context,
      {required String shelfTitle, required String category}) {
    List<Book> books =
        bookList.where((book) => book.category == category).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            shelfTitle,
            style: const TextStyle(
              fontFamily: 'Rubik',
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 24),
        SizedBox(
          height: 270,
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            scrollDirection: Axis.horizontal,
            itemCount: books.length,
            separatorBuilder: (context, index) => const SizedBox(width: 16),
            itemBuilder: (context, index) {
              final Book book = books[index];

              return SizedBox(
                width: 145,
                child: InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return Detail(book: book);
                    }));
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        flex: 5,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Stack(
                            children: <Widget>[
                              Image.asset('images/books/${book.image}'),
                              Positioned(
                                top: 0,
                                right: 0,
                                child: Container(
                                  padding: const EdgeInsets.all(4),
                                  decoration: const BoxDecoration(
                                    color: Colors.orange,
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(8),
                                    ),
                                  ),
                                  child: Row(
                                    children: <Widget>[
                                      const Icon(
                                        Icons.star,
                                        size: 14,
                                        color: Colors.white,
                                      ),
                                      Text(
                                        book.rating.toString(),
                                        style: const TextStyle(
                                          fontSize: 14,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Expanded(
                        flex: 1,
                        child: Text(
                          book.name,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(fontSize: 18),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget bottomNavbar(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Beranda',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.bookmark),
          label: 'Rak Pribadi',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_basket),
          label: 'Keranjang',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Akun',
        ),
      ],
      type: BottomNavigationBarType.fixed,
      currentIndex: 0,
      selectedItemColor: Colors.orange,
      unselectedItemColor: Colors.grey,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      onTap: (index) {
        switch (index) {
          case 1:
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return const PrivateShelf();
            }));
            break;
          case 2:
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return const Basket();
            }));
            break;
          case 3:
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return const Account();
            }));
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(height: 16),
                appTitle,
                const SizedBox(height: 32),
                welcomingHeader,
                const SizedBox(height: 20),
                searchBar(context),
                const SizedBox(height: 32),
                popularBook(context),
                const SizedBox(height: 16),
                bookshelf(context, shelfTitle: 'Sains', category: 'sains'),
                const SizedBox(height: 16),
                bookshelf(context, shelfTitle: 'Novel', category: 'novel'),
                const SizedBox(height: 16),
                bookshelf(context, shelfTitle: 'Komik', category: 'komik'),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: bottomNavbar(context),
    );
  }
}
