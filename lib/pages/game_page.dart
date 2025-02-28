import 'package:flutter/material.dart';
import 'package:learning_english/model/content.dart';
import 'package:learning_english/pages/home_page.dart';
import 'package:learning_english/widget/global.dart';

class GamePage extends StatefulWidget {
  const GamePage({
    super.key,
  });

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  int score = 0;
  int gameCount = 0;
  List<Content> list2 = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    for (var e in Global.list) {
      list2.add(e);
      list2.shuffle();

      for (var e in Global.list) {
        e.isDropped = false;
        for (var e in list2) {
          e.isDropped = false;
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height / 7;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(Global.image), fit: BoxFit.cover)),
        child: Column(
          children: [
            Expanded(
                child: Row(
              children: [
                Expanded(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: Global.list.map((e) {
                    int i = list2.indexOf(e);
                    return Global.list[i].isDropped == true
                        ? Container(
                            height: height,
                          )
                        : Draggable(
                            data: Global.list[i].value,
                            feedback: Container(
                              height: height,
                              padding: const EdgeInsets.all(10),
                              child: Image.asset(
                                Global.list[i].image,
                                fit: BoxFit.cover,
                              ),
                            ),
                            childWhenDragging: Container(
                              height: height,
                            ),
                            child: Container(
                              height: height,
                              padding: const EdgeInsets.all(10),
                              child: Image.asset(
                                Global.list[i].image,
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                  }).toList(),
                )),
                Expanded(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: list2.map((e) {
                          int i = list2.indexOf(e);
                          return list2[i].isDropped == true
                              ? Container(
                                  height: height,
                                  child: Image.asset(
                                    "assets/true.png",
                                    fit: BoxFit.cover,
                                  ),
                                )
                              : DragTarget(
                                  onAccept: (date) {
                                    if (list2[i].value == date) {
                                      setState(() {
                                        for (var e in Global.list) {
                                          if (e.value == list2[i].value) {
                                            e.isDropped = true;
                                          }
                                        }
                                        list2[i].isDropped = true;
                                        gameCount++;
                                        score += 10;
                                        if (gameCount == Global.list.length) {
                                          showDialog(
                                              context: context,
                                              builder: (context) {
                                                return AlertDialog(
                                                  title: const Text(
                                                    "winner winner chicken dinner",
                                                    style: TextStyle(
                                                        color: Colors.blue,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 30),
                                                  ),
                                                  actions: [
                                                    TextButton(
                                                        onPressed: () {
                                                          Navigator.push(
                                                              context,
                                                              MaterialPageRoute(
                                                                  builder: (_) {
                                                            return GamePage();
                                                          }));
                                                        },
                                                        child: const Text(
                                                          "restart",
                                                          style: TextStyle(
                                                            color: Colors.green,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        )),
                                                    TextButton(
                                                        onPressed: () {
                                                          Navigator.push(
                                                              context,
                                                              MaterialPageRoute(
                                                                  builder: (_) {
                                                            return const HomePage();
                                                          }));
                                                        },
                                                        child: const Text(
                                                          "back",
                                                          style: TextStyle(
                                                              color: Colors.red,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ))
                                                  ],
                                                );
                                              });
                                        }
                                      });
                                    }
                                  },
                                  builder: (BuildContext context,
                                      List<Object?> candidateData,
                                      List<dynamic> rejectedData) {
                                    return Container(
                                      alignment: Alignment.center,
                                      height: height,
                                      child: Text(
                                        list2[i].value,
                                        style: TextStyle(
                                            color: Colors.brown.shade900,
                                            fontSize: 30,
                                            fontWeight: FontWeight.w900,
                                            shadows: [
                                              Shadow(
                                                  color: Colors.brown.shade900,
                                                  blurRadius: 30),
                                              const Shadow(
                                                  color: Colors.white,
                                                  blurRadius: 10),
                                              const Shadow(
                                                  color: Colors.white,
                                                  blurRadius: 30),
                                            ]),
                                      ),
                                    );
                                  },
                                );
                        }).toList())),
              ],
            )),
            Container(
              height: 80,
              color: Colors.white.withOpacity(0.6),
              child: Center(
                child: Text(
                  "score :$score",
                  style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 30),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
