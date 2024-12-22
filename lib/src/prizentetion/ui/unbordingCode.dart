class Unbording {
  String image;
  String title;
  String discripton;

  Unbording(
      {required this.image, required this.title, required this.discripton});
}

List<Unbording> contents = [
  Unbording(
      image: 'assets/images/im1.png',
      title: 'Instant Conversion',
      discripton:
          'Easily convert USD into your favorite\n cryptocurrencies with just a tap'),
  Unbording(
      image: 'assets/images/im2.png',
      title: 'Visualize the Market',
      discripton:
          'Dive into detailed price charts to\n monitor cryptocurrency trends'),
  Unbording(
      image: 'assets/images/im3.png',
      title: 'Discover Crypto Insights',
      discripton:
          'Discover key facts about cryptocurrencies\n — their history, features, and uniqueness'),
  Unbording(
      image: 'assets/images/im4.png',
      title: 'Record all your P2P’s',
      discripton:
          'EasilyRecord all your P2P transactions:\n who, when, and how much'),
];
