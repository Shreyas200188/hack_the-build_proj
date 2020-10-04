import 'package:Hack_the_build/analysis.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:Hack_the_build/data_models/Card.dart';
import 'package:Hack_the_build/analysis.dart';

class Disease extends StatefulWidget {
  @override
  _DiseaseState createState() => _DiseaseState();
}

class _DiseaseState extends State<Disease> with SingleTickerProviderStateMixin {
  var answers=Map();
  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }
  void p(){
    print(answers);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            Padding(
                padding: EdgeInsets.all( 20.0),
                child: GestureDetector(
                  onTap: () {Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => Analysis(answers),
                  ));},
                  child: Text(
                    'DONE',
                  ),
                )
            ),
          ],
        ),
        body: Row(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: CarouselSlider(
                options: CarouselOptions(
                  height: MediaQuery.of(context).size.height - 150,
                ),
                items: [
                  'skin',
                  'ent',
                  'stomach',
                  'bowel movements and digestion',
                  'urinary issues',
                  'movement and joints',
                  'eyes and vision',
                  'heart and circulation',
                  'behavioural issues',
                  'general'
                ].map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        width: 500,
                        height: MediaQuery.of(context).size.height-200,
                        margin: EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(color: Colors.lightBlueAccent),
                        child: Column(children: [
                          Text(
                            i,
                            style: TextStyle(fontSize: 22.0,fontWeight: FontWeight.bold),
                          ),
                          customcard(i,answers),
                        ]),
                      );
                    },
                  );
                }).toList(),
              ),
            ),
          ],
        ));
  }
}
