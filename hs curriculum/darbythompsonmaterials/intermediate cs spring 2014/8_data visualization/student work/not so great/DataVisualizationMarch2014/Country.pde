class Country {
  String name;
  String population;
  String[] lines = loadStrings("FrenchSpeakersData.txt");

  Country(String n, String pop) {
    name= n;
    population= pop;
  }
}





