import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:Hack_the_build/quizpage.dart';
import 'package:Hack_the_build/disease.dart';

class homepage extends StatefulWidget {
  @override
  _homepageState createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  List<String> images = [
    "images/depression.png",
    "images/disease.png",
  ];

  List<String> des = [
    "You will be given 18 questions to answer. Rank each of them on a scale of 5. 1(Not at all), 5(100% Sure).",
    "You will be prompted to select the symptoms that you are seeing. Based on which we'll predict the diseases you are suffering from most likely.",
  ];

  Widget customcard(String langname, String image, String des) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 20.0,
        horizontal: 30.0,
      ),
      child: InkWell(
        onTap: () {
          if (langname == "Depression Quiz") {
            Navigator.of(context).pushReplacement(MaterialPageRoute(
              // in changelog 1 we will pass the langname name to ther other widget class
              // this name will be used to open a particular JSON file
              // for a particular language
              builder: (context) => getjson(langname),
            ));
          } else if (langname == "Disease Quiz") {
            Navigator.of(context).pushReplacement(MaterialPageRoute(
              // in changelog 1 we will pass the langname name to ther other widget class
              // this name will be used to open a particular JSON file
              // for a particular language
              builder: (context) => Disease(),
            ));
          }
        },
        child: Material(
          color: Colors.indigoAccent,
          elevation: 10.0,
          borderRadius: BorderRadius.circular(25.0),
          child: Container(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 10.0,
                  ),
                  child: Material(
                    elevation: 5.0,
                    borderRadius: BorderRadius.circular(100.0),
                    child: Container(
                      // changing from 200 to 150 as to look better
                      height: 150.0,
                      width: 150.0,
                      child: ClipOval(
                        child: Image(
                          fit: BoxFit.cover,
                          image: AssetImage(
                            image,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    langname,
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                      fontFamily: "Quando",
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(20.0),
                  child: Text(
                    des,
                    style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.white,
                        fontFamily: "Alike"),
                    maxLines: 5,
                    textAlign: TextAlign.justify,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Hack_The_Build",
          style: TextStyle(
            fontFamily: "Quando",
          ),
        ),
      ),
      body: ListView(
        children: <Widget>[
          customcard("Depression Quiz", images[0], des[0]),
          customcard("Disease Quiz", images[1], des[1]),
        ],
      ),
    );
  }
}
