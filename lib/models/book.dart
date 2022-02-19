class Book {
  String name, author, description, category, image;
  double price, rating;
  int totalBuyers;

  int qtyInBasket = 0;
  bool isOnPrivateShelf = false;

  Book({
    required this.name,
    required this.author,
    required this.description,
    required this.category,
    required this.image,
    required this.price,
    required this.rating,
    required this.totalBuyers,
  });

  double totalPurchases() => qtyInBasket * price;
}

List<Book> bookList = [
  Book(
    name: 'Rancang Agung',
    author: 'Stephen Hawking',
    description:
        'Rancang Agung (The Grand Design) adalah buku ilmu pengetahuan populer yang ditulis oleh fisikawan Stephen Hawking dan Leonard Mlodinow. Buku ini diterbitkan di Amerika Serikat oleh Bantam Books pada tahun 2010.',
    category: 'sains',
    image: 'rancang-agung.jpg',
    price: 59999,
    rating: 4.8,
    totalBuyers: 94,
  ),
  Book(
    name: 'Pale Blue Dot',
    author: 'Carl Sagan',
    description:
        'Pale Blue Dot: A Vision of the Human Future in Space (1994) adalah buku nonfiksi karya Carl Sagan. Buku ini merupakan sekuel Cosmos: A Personal Voyage dan terinspirasi dari foto "Pale Blue Dot". Sagan memberi deskripsi mendalam tentang foto tersebut dalam buku ini.',
    category: 'sains',
    image: 'pale-blue-dot.jpg',
    price: 110900,
    rating: 4.6,
    totalBuyers: 59,
  ),
  Book(
    name: 'Cosmos',
    author: 'Carl Sagan',
    description:
        'Cosmos (1980) adalah buku sains populer karya astronom Carl Sagan. Buku ini berisi 13 bagian yang didasarkan dari 13 episode acara TV Cosmos: A Personal Voyage. Pada tahun 1981, buku ini mendapat Penghargaan Hugo untuk kategori buku nonfiksi terbaik.',
    category: 'sains',
    image: 'cosmos.jpg',
    price: 80500,
    rating: 4.8,
    totalBuyers: 115,
  ),
  Book(
    name: 'The Selfish Gene',
    author: 'Richard Dawkins',
    description:
        'The Selfish Gene adalah buku mengenai evolusi. Buku ini dibuat berdasarkan teori George C. Williams dalam bukunya Adaptation and Natural Selection. Richard Dawkins menyatakan evolusi makhluk hidup dapat dijelaskan sebagai upaya gen membela kepentingan pribadi.',
    category: 'sains',
    image: 'the-selfish-gene.jpg',
    price: 120000,
    rating: 4.2,
    totalBuyers: 50,
  ),
  Book(
    name: 'Laskar Pelangi',
    author: 'Andrea Hirata',
    description:
        'Laskar Pelangi adalah novel yang bercerita tentang kehidupan 10 anak dari keluarga miskin yang bersekolah di sebuah sekolah Muhammadiyah di Belitung yang penuh dengan keterbatasan. Mereka bersekolah pada kelas yang sama dan menyebut diri mereka sebagai Laskar Pelangi.',
    category: 'novel',
    image: 'laskar-pelangi.jpg',
    price: 89000,
    rating: 4.8,
    totalBuyers: 222,
  ),
  Book(
    name: 'Edensor',
    author: 'Andrea Hirata',
    description:
        'Edensor adalah buku ketiga dari Tetralogi Laskar Pelangi. Berbeda dengan latar cerita dari Laskar Pelangi dan Sang Pemimpi, Edensor mengambil latar di luar negeri saat tokoh-tokoh utamanya (Ikal dan Arai) mendapat beasiswa dari Uni Eropa untuk kuliah S2 di Prancis.',
    category: 'novel',
    image: 'edensor.jpg',
    price: 32333,
    rating: 4.2,
    totalBuyers: 85,
  ),
  Book(
    name: 'Dilan: Dia adalah Dilanku tahun 1990',
    author: 'Pidi Baiq',
    description:
        'Dilan: Dia adalah Dilanku tahun 1990 adalah novel yang bercerita tentang kisah cinta dua remaja Bandung pada tahun 90-an, yaitu Dilan dan Milea. Dilan yang merupakan anggota geng sepeda motor memiliki beragam cara untuk mendekati dan mencuri perhatian Milea.',
    category: 'novel',
    image: 'dilan-dia-adalah-dilanku-tahun-1990.jpg',
    price: 79100,
    rating: 4.5,
    totalBuyers: 185,
  ),
  Book(
    name: 'Tenggelamnya Kapal van der Wijck',
    author: 'Hamka',
    description:
        'Tenggelamnya Kapal van der Wijck merupakan sebuah novel yang mengisahkan persoalan adat yang berlaku di Minangkabau dan perbedaan latar belakang sosial yang menghalangi hubungan cinta sepasang kekasih.',
    category: 'novel',
    image: 'tenggelamnya-kapal-van-der-wijck.jpg',
    price: 77000,
    rating: 4.8,
    totalBuyers: 236,
  ),
  Book(
    name: 'Doraemon Vol. 0',
    author: 'Fujiko F. Fujio',
    description:
        'Doraemaon Vol. 0 merupakan sebuah komik yang dibuat untuk merayakan 50 tahun kelahiran Doraemon. Komik ini berisi kumpulan enam bab versi awal Doraemon dengan tampilan halaman yang berwarna.',
    category: 'komik',
    image: 'doraemon-vol-0.jpg',
    price: 54400,
    rating: 4.5,
    totalBuyers: 90,
  ),
  Book(
    name: 'Jujutsu Kaisen Vol. 0',
    author: 'Gege Akutami',
    description:
        'Jujutsu Kaisen (Pertarungan Sihir) adalah sebuah seri manga shounen asal Jepang yang ditulis dan diilustrasikan oleh Gege Akutami. Komik ini bercerita tentang Yuji Itadori yang secara tidak sengaja menjadi penyihir Jujutsu setelah memakan jari Sukuna, Raja Kutukan.',
    category: 'komik',
    image: 'jujutsu-kaisen-vol-0.jpg',
    price: 139200,
    rating: 4.8,
    totalBuyers: 138,
  ),
  Book(
    name: 'Demon Slayer: Kimetsu No Yaiba Vol. 1',
    author: 'Koyoharu Gotouge',
    description:
        'Demon Slayer: Kimetsu no Yaiba adalah sebuah seri manga Jepang yang ditulis dan diilustrasikan oleh Koyoharu Gotouge. Ceritanya mengisahkan tentang Tanjiro Kamado, seorang anak laki-laki yang menjadi pembasmi iblis setelah keluarganya dibunuh.',
    category: 'komik',
    image: 'demon-slayer-vol-1.jpg',
    price: 50900,
    rating: 4.8,
    totalBuyers: 139,
  ),
  Book(
    name: 'Attack on Titan Vol. 1',
    author: 'Hajime Isayama',
    description:
        'Attack on Titan adalah sebuah seri manga shounen asal Jepang yang ditulis dan diilustrasikan oleh Hajime Isayama. Ceritanya berlatar di dunia tempat umat manusia hidup di wilayah yang dikelilingi tiga lapis tembok besar untuk melindungi mereka dari Titan.',
    category: 'komik',
    image: 'attack-on-titan-vol-1.jpg',
    price: 125750,
    rating: 4.8,
    totalBuyers: 167,
  ),
];
