class Travel {
  String name;
  String location;
  String url;
  String description;

  Travel(this.name, this.location, this.url, this.description);

  static List<Travel> generateTravelBlog() {
    return [
      Travel('Kulu Manali', 'Himachal Pradesh', 'assets/images/top1.jpg',
          "Manali is a town in the Indian state of Himachal Pradesh. It is situated in the northern end of the Kullu Valley, formed by the Beas River."),
      Travel('Baga Beach', 'Goa', 'assets/images/top2.jpg',
          "Baga Beach is a popular beach and tourist destination in North Goa. Baga is located at the north end of the contiguous beach stretch that starts from Sinquerim, Candolim, leads to Calangute, and then to Baga."),
      Travel('Spiti Valley', 'Manali', 'assets/images/top3.jpg',
          "A picturesque paradise echoing with tranquillity and spirituality, Spiti Valley is home to several Buddhist monasteries and stunning natural sites, most of which are unexplored and hence, unspoilt. Snuggled in Himachal Pradesh, the valley boasts a jagged landscape that is cut by the pristine and fast-flowing Spiti river, gushing through deep gorges and valleys. The river is very popular among water sports enthusiasts, especially for river rafting. The lush and emerald landscape of the valley, surrounded by snow-capped mountains, is ideal for lovers of adventure-sports like trekking, paragliding and camping."),
      Travel('Darjeeling', 'West Bengal', 'assets/images/top4.jpg',
          "Darjeeling - Darjeeling is a hill station in the Eastern State of West Bengal. Also called the queen of hill-stations, at an altitude of 2134 m. or 7000 ft, it is a famous hill resort offering a breath taking sight of the numerous peaks of the majestic Himalayas.The clouds seem to whisper to one another here and from horizon to horizon stretches the Kanchanjunga, covered with snow from the head to foot all round the year. The views of Kanchanjunga and Mount Everest are particularly inspiring and are alone a good reason to visit Darjeeling."),
    ];
  }

  static List<Travel> generateMostPopular() {
    return [
      Travel('Baga Beach', 'West Bengal', 'assets/images/bottom1.jpg',
          "Baga Beach is a popular beach and tourist destination in North Goa. Baga is located at the north end of the contiguous beach stretch that starts from Sinquerim, Candolim, leads to Calangute, and then to Baga."),
      Travel('Lotus Temple', 'Jaipur', 'assets/images/bottom2.jpg',
          "The Lotus Temple, located in Delhi, India, is a Baháʼí House of Worship that was dedicated in December 1986. Notable for its flowerlike shape, it has become a prominent attraction in the city. Like all Houses of Worship, the Lotus Temple is open to all, regardless of religion or any other qualification."),
      Travel('Spiti Valley', 'Manali', 'assets/images/bottom3.jpg',
          "A picturesque paradise echoing with tranquillity and spirituality, Spiti Valley is home to several Buddhist monasteries and stunning natural sites, most of which are unexplored and hence, unspoilt. Snuggled in Himachal Pradesh, the valley boasts a jagged landscape that is cut by the pristine and fast-flowing Spiti river, gushing through deep gorges and valleys. The river is very popular among water sports enthusiasts, especially for river rafting. The lush and emerald landscape of the valley, surrounded by snow-capped mountains, is ideal for lovers of adventure-sports like trekking, paragliding and camping."),
      Travel('Darjeeling', 'West Bengal', 'assets/images/bottom4.jpg',
          "Darjeeling - Darjeeling is a hill station in the Eastern State of West Bengal. Also called the queen of hill-stations, at an altitude of 2134 m. or 7000 ft, it is a famous hill resort offering a breath taking sight of the numerous peaks of the majestic Himalayas.The clouds seem to whisper to one another here and from horizon to horizon stretches the Kanchanjunga, covered with snow from the head to foot all round the year. The views of Kanchanjunga and Mount Everest are particularly inspiring and are alone a good reason to visit Darjeeling."),
    ];
  }
}
