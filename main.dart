import 'package:flutter/material.dart';
import 'package:flutterapp/constants.dart';
import 'package:provider/provider.dart';
import 'package:flutterapp/screens/home_screens.dart';
import 'package:flutterapp/screens/launch_screen.dart';
import 'package:flutterapp/screens/result_screen.dart';
import 'package:flutterapp/state/vote.dart';

void main() {
  runApp(Vota());
}

class Vota extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          builder: (_) => VoteState(),
        )
      ],
      child: MaterialApp(
        initialRoute: "/",
        routes: {
          "/": (context) =>  Scaffold(body: LaunchScreen(),
      ),

        '/home': (context) => Scaffold(
          appBar: AppBar(
            title: Text(KAppName),
          ),
          body: HomeScreen(),
        ),

          '/result': (context) => Scaffold(
            appBar: AppBar(
              title: Text('Result'),
              leading: IconButton(
                icon: Icon(Icons.home),
                color: Colors.white,
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/home');
                },

              ),

            ),
            body: ResultScreen(),

          )
        },
      ),
    );
  }
}