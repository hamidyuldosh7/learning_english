import 'package:learning_english/model/content.dart';

class Global {
  static List<Content> list = [];
  static String image = '';
  static List<Content> animals = [
    Content(image: "assets/animals/cow.png", value: "Cow", isDropped: false),
    Content(
        image: "assets/animals/fil.png", value: "Elephant", isDropped: false),
    Content(image: "assets/animals/kiyik.png", value: "Deer", isDropped: false),
    Content(
        image: "assets/animals/maymun.png", value: "Monkey", isDropped: false),
    Content(image: "assets/animals/ot.png", value: "Horse", isDropped: false),
    Content(image: "assets/animals/sher.png", value: "Lion", isDropped: false),
  ];
  static List<Content> fruits = [
    Content(
        image: "assets/fruits/apelsin.png", value: "orange", isDropped: false),
    Content(
        image: "assets/fruits/banan.png", value: "banana", isDropped: false),
    Content(image: "assets/fruits/mango.png", value: "mango", isDropped: false),
    Content(image: "assets/fruits/olma.png", value: "apple", isDropped: false),
    Content(
        image: "assets/fruits/qulupnay.png",
        value: "strawberry",
        isDropped: false),
    Content(
        image: "assets/fruits/tarvuz.png",
        value: "watermelon",
        isDropped: false),
  ];
  static List<Content> numbers = [
    Content(image: "assets/numbers/25.png", value: "5*5", isDropped: false),
    Content(image: "assets/numbers/35.png", value: "7*5", isDropped: false),
    Content(image: "assets/numbers/50.png", value: "5*10", isDropped: false),
    Content(image: "assets/numbers/70.png", value: "7*10", isDropped: false),
    Content(image: "assets/numbers/81.png", value: "9*9", isDropped: false),
    Content(image: "assets/numbers/90.png", value: "9*10", isDropped: false),
  ];
  static List<Content> colors = [
    Content(image: "assets/colors/red.png", value: "red", isDropped: false),
    Content(image: "assets/colors/blue.png", value: "blue", isDropped: false),
    Content(image: "assets/colors/black.png", value: "black", isDropped: false),
    Content(image: "assets/colors/yellow.png", value: "yellow", isDropped: false),
    Content(image: "assets/colors/pink.png", value: "pink", isDropped: false),
    Content(image: "assets/colors/green.png", value: "green", isDropped: false),
  ];
}
