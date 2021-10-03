// @dart=2.9
import 'package:flutter/material.dart';
import 'package:dad_jokes/helpers/api-helper.dart';
import 'package:dad_jokes/screens/joke_screen.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:google_fonts/google_fonts.dart';
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
        backgroundColor: Colors.lightBlueAccent,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(
            "Instant Dad Jokes",
            style: GoogleFonts.ibmPlexSerif(
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
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text("Ready to ROFL ? ", style: GoogleFonts.aladin(
                fontSize: 40,
                letterSpacing: 2,


              ),),
              Text("Tap the smiley and go on!",
              style: GoogleFonts.justMeAgainDownHere(
                fontSize: 30,
                fontWeight: FontWeight.bold

              ),),
              GestureDetector(
                child: Image.asset("images/lol-circle.gif"),
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
