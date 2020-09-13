class Constants {
  static String topHeadLinesUrl =
      "https://newsapi.org/v2/top-headlines?country=in&apiKey=UseYourOwnKey";

  static String headLinesFor(String keyWord) {
    return "https://newsapi.org/v2/everything?q=$keyWord&apiKey=UseYourOwnKey";
  }
}
