import 'package:flutter/material.dart';
import 'package:Hack_the_build/home.dart';

class resultpage extends StatefulWidget {
  int marks;

  resultpage({Key key, @required this.marks}) : super(key: key);

  @override
  _resultpageState createState() => _resultpageState(marks);
}

class _resultpageState extends State<resultpage> {
  List<String> images = [
    "images/success.png",
    "images/good.png",
    "images/bad.png",
  ];

  String message;
  String image;

  @override
  void initState() {
    if (marks < 10) {
      image = images[2];
      message =
          "Hallelujah! You are living the happiest life you can. There may be ups and downs which are considered normal behaviour.\nKeep yourself engaged in doing things you love and never let that smile of yours fade away. :-).";
    } else if (marks >= 10 && marks < 18) {
      image = images[1];
      message =
          "You are normally a cheerful person but may be susceptible to mild mood disturbances. These may be due to adolescence. Cultivating a hobby would do wonders in getting away from the negativities in life.";
    } else if (marks >= 18 && marks < 22) {
      image = images[0];
      message =
          "You contemplate a lot. Which is good for a healthy mind but overthinking over an event may make you feel low at times. Live in the moment and don't delve deep on issues of the past";
    } else if (marks >= 22 && marks < 36) {
      image = images[0];
      message =
          "You feel more than just blue. You are on the starting stages of Depression and your symptoms can go on for days and are noticeable enough to interfere with your usual activities.\nMaintaining a healthy body and mind would help you relax in times of anxiety. Try to get enough delay and impart important nutrients in your diet.";
    } else if (marks >= 36 && marks < 54) {
      image = images[0];
      message =
          "You are having problems with self-esteem that is resulting in low productivity, increased sensitiveness and excessive worrying. You are in the region of Severe Depression.\nYou should see a therapist as soon as possible. Spend more time with friends and family and hit the Gym regularly. Drink lots of water and meditate on a daily basis.";
    } else {
      image = images[0];
      message =
          "Helpline Number: 022 2754 6669\nYou may have experienced delusions, feelings of stupor, halucinations or suicidal thoughts before.\nYou are in dire need of Medical Thrapy as soon as possible. Spend more time with friends and family and do lots of physical activity.";
    }
    super.initState();
  }

  int marks;

  _resultpageState(this.marks);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Result",
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 8,
            child: Material(
              elevation: 10.0,
              child: Container(
                child: Column(
                  children: <Widget>[
                    Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 5.0,
                          horizontal: 15.0,
                        ),
                        child: Center(
                          child: Text(
                            message,
                            style: TextStyle(
                              fontSize: 18.0,
                              fontFamily: "Quando",
                            ),
                          ),
                        )),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                OutlineButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => homepage(),
                    ));
                  },
                  child: Text(
                    "Continue",
                    style: TextStyle(
                      fontSize: 18.0,
                    ),
                  ),
                  padding: EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 25.0,
                  ),
                  borderSide: BorderSide(width: 3.0, color: Colors.indigo),
                  splashColor: Colors.indigoAccent,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
