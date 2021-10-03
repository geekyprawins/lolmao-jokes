// @dart=2.9
import 'package:flutter/material.dart';
import 'package:dad_jokes/helpers/api-helper.dart';
import 'package:dad_jokes/screens/joke_screen.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    ApiHelper apiHelper = ApiHelper();
    bool showSpinner = false;
    return ModalProgressHUD(
      inAsyncCall: showSpinner,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(
            "Instant Dad Jokes",
            style: TextStyle(
                fontStyle: FontStyle.italic, fontWeight: FontWeight.bold),
          ),
          leading: Hero(
            tag: "joker",
            child: Image.asset(
              "images/komedy-2.png",
              fit: BoxFit.cover,
            ),
          ),
        ),
        body: Container(
          color: Colors.lightBlueAccent,
          padding: EdgeInsets.all(MediaQuery.of(context).size.width / 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text("Missing those pun filled Dad Jokes? Not anymore!"),
              Text("Click below and enjoy a dad joke!"),
              GestureDetector(
                child: Image.asset("images/lol-2.gif"),
                onTap: () async {
                  setState(() {
                    showSpinner = true;
                  });
                  await apiHelper.getDadJoke().then((value) => {
                        setState(() {
                          showSpinner = false;
                        }),
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => JokeScreen(value),
                          ),
                        ),
                      });
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
