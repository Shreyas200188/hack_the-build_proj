import 'package:flutter/material.dart';
import 'package:Hack_the_build/home.dart';
import 'package:starflut/starflut.dart';

class Analysis extends StatelessWidget {
  final result;

  Analysis(this.result);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
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
          ),
        ],
      )
    );
  }

}
