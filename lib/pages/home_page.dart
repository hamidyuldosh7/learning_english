import 'package:flutter/material.dart';
import 'package:learning_english/pages/game_page.dart';
import 'package:learning_english/widget/global.dart';
import 'package:lottie/lottie.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/img.png"),
                    fit: BoxFit.cover)),
            child: ListView(
              children: [
                SizedBox(
                  height: 100,
                  child: Lottie.asset("assets/lottie/home_page.json"),
                ),
                InkWell(
                  onTap: () {
                    Global.list = Global.animals;
                    Global.image = "assets/images/img_5.png";
                    Navigator.push(context, MaterialPageRoute(builder: (_) {
                      return GamePage();
                    }));
                  },
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.35,
                    width: double.infinity,
                    child: gameContainer(
                        image: "assets/images/img_2.png", name: "animals game"),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Global.list = Global.fruits;
                    Global.image = "assets/fruits/fon1.png";
                    Navigator.push(context, MaterialPageRoute(builder: (_) {
                      return GamePage();
                    }));
                  },
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.35,
                    width: double.infinity,
                    child: gameContainer(
                      image: "assets/images/img_3.png",
                      name: "Fruits Game",
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Global.list = Global.numbers;
                    Global.image = "assets/numbers/img_1.png";
                    Navigator.push(context, MaterialPageRoute(builder: (_) {
                      return GamePage();
                    }));
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.35,
                    width: double.infinity,
                    child: gameContainer(
                        image: "assets/images/img_4.png", name: "Numbers game"),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Global.list = Global.colors;
                    Global.image = "assets/colors/fon.png";
                    Navigator.push(context, MaterialPageRoute(builder: (_) {
                      return GamePage();
                    }));
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.35,
                    width: double.infinity,
                    child: gameContainer(
                        image: "assets/colors/colors_game.png",
                        name: "Colors game"),
                  ),
                ),
              ],
            )));
  }

  Widget gameContainer({
    image,
    name,
  }) {
    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(.2),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(width: 5, color: Colors.brown.shade700),
      ),
      child: Column(
        children: [
          Expanded(
              child: Image.asset(
            image,
            fit: BoxFit.cover,
          )),
          Text(
            name,
            style: TextStyle(
                color: Colors.brown.shade900,
                fontSize: 30,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
