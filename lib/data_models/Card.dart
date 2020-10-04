import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class customcard extends StatelessWidget {
  String heading;
  List<String> symptoms;
  var answer;
  customcard(this.heading,this.answer);

  String assettoload;

  setasset() {
    if (heading == 'skin') {
      assettoload = "assets/skin.json";
    } else if (heading == 'ent') {
      assettoload = "assets/ent.json";
    } else if (heading == 'stomach') {
      assettoload = "assets/stomach.json";
    } else if (heading == 'bowel movements and digestion') {
      assettoload = "assets/bowel_movement_and_digestion.json";
    } else if (heading == 'urinary issues') {
      assettoload = "assets/urinary_issues.json";
    } else if (heading == 'movement and joints') {
      assettoload = "assets/movement_and_joints.json";
    } else if (heading == 'eyes and vision') {
      assettoload = "assets/eyes_and_vision.json";
    } else if (heading == 'heart and circulation') {
      assettoload = "assets/heart_and_circulation.json";
    } else if (heading == 'behavioural issues') {
      assettoload = "assets/behavioural_issues.json";
    } else if (heading == 'general') {
      assettoload = "assets/general.json";
    }
  }

  @override
  Widget build(BuildContext context) {
    setasset();
    return FutureBuilder(
      future:
          DefaultAssetBundle.of(context).loadString(assettoload, cache: false),
      builder: (context, snapshot) {
        List mydata = json.decode(snapshot.data.toString());
        if (mydata == null) {
          return Scaffold(
            body: Center(
              child: Text(
                "Loading",
              ),
            ),
          );
        } else {
          return options(mydata: mydata,answer: answer,heading: heading);
        }
      },
    );
  }
}

class options extends StatefulWidget {
  final List mydata;
  var answer;
  var heading;
  options({Key key, @required this.mydata, this.answer,this.heading}) : super(key: key);

  @override
  _optionsState createState() => _optionsState(mydata,answer,heading);
}

class _optionsState extends State<options> {
  final List mydata;
  var answers;
  var heading;
  final answer=Map();
  _optionsState(this.mydata,this.answers,this.heading);

  @override
  void initState() {
    for (int i = 0; i < mydata[0].length; i++) {
      answer[mydata[0][(i + 1).toString()]] = 0;
    }
  }

  Widget checkbox(String title, bool boolValue) {
    return Column(
      children: <Widget>[
        CheckboxListTile(
          title: Text(title),
          value: boolValue,
          onChanged: (bool value) {
            setState(() {
              boolValue = value;
              answer[title] = (value==true)?1:0;
              answers[heading]=answer;
            });
          },
          controlAffinity: ListTileControlAffinity.leading,
        ),
        SizedBox(width: 10.0, height: 5.0),
      ],
    );
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      //width: 200,
      height: 600,
      child: SingleChildScrollView(
        child: ListView.builder(
          shrinkWrap: true,
          physics: ScrollPhysics(),
          itemBuilder: (context, index) {
            return checkbox(mydata[0][(index+1).toString()],(answer[mydata[0][(index+1).toString()]]==1)?true:false);
          },
          itemCount: mydata[0].length,
        ),
      ),
    );
  }
}
