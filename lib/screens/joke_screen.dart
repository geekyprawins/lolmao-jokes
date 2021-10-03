import 'package:flutter/material.dart';

class JokeScreen extends StatefulWidget {
  late final joke;
  JokeScreen(this.joke);
  @override
  _JokeScreenState createState() => _JokeScreenState();
}

class _JokeScreenState extends State<JokeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(MediaQuery.of(context).size.width / 6),
      color: Colors.black54,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Hero(tag: "joker", child: Image.asset("images/komedy-2.png")),
            Text(
              widget.joke,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontFamily: "Arial",
                  decoration: TextDecoration.none),
            ),
          ],
        ),
      ),
    );
  }
}
