import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutterapp/constants.dart';
import 'package:flutterapp/widgets/shared_widgets.dart';

class LaunchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      margin: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 100),
            child: Text(
              KAppName,
              style: TextStyle(
                fontSize: 40.0,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
            ),
          ),
          SizedBox(
            height: 200.0,
          ),
          LoginButton(
            label: 'Google Sign In',
            onPresssed: () => signIN(context),
          ),
          SizedBox(
            height: 10,
          ),
          LoginButton(
            label: 'Anonnymous Sign In',
            onPresssed: () =>signIN(context),
          )
        ],
      ),
    );
  }

  void signIN(BuildContext context){
    Navigator.pushReplacementNamed(context, '/home');
  }
}