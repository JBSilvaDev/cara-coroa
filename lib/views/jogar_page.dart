// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'dart:math';

import 'package:flutter/material.dart';

class JogarPage extends StatefulWidget {
  const JogarPage({Key? key}) : super(key: key);

  @override
  State<JogarPage> createState() => _JogarPageState();
}

class _JogarPageState extends State<JogarPage> {
  List<String> jogada = ['cara', 'coroa'];
  String moeda = 'assets/images/coroa.png';
  bool visivel = true;

  void startGame() async {
    var indexList = Random().nextInt(2);
    moeda = 'assets/images/moeda_gira.gif';
    setState(() {
      visivel = false;
    });

    await Future.delayed(
      Duration(milliseconds: 1200),
      () => moeda = 'assets/images/${jogada[indexList]}.png',
    );

    setState(() {});

    await Future.delayed(
      Duration(milliseconds: 3000),
    );
    setState(() {
      visivel = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff61bd86),
      appBar: AppBar(
          title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Text('Cara ou Coroa?')],
      )),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 50.0, bottom: 50),
                child: Image.asset(
                  'assets/images/logo.png',
                ),
              ),
              Visibility(
                visible: visivel,
                child: Text(
                  'Joga ai!',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueGrey,
                  ),
                ),
              ),
              Visibility(
                visible: !visivel,
                child: CircleAvatar(
                  backgroundColor: Colors.green,
                  backgroundImage: AssetImage(moeda),
                  maxRadius: 80,
                  minRadius: 30,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50.0, bottom: 50),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.all(10),
                        shadowColor: Colors.yellow,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                    onPressed: !visivel ? null : startGame,
                    child: Text(
                      'Jogar',
                      style: TextStyle(fontSize: 30),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
