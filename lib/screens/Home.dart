import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterscratchwin/screens/HomeData.dart';
import 'package:flutterscratchwin/screens/scratch.dart';

class Mainpage extends StatefulWidget {
  Mainpage({Key key}) : super(key: key);

  @override
  _MainpageState createState() => _MainpageState();
}

class _MainpageState extends State<Mainpage> {
  @override
  Widget build(BuildContext context) {
    FirebaseAuth auth = FirebaseAuth.instance;

    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          title: Text(
            "Scratch Simulator",
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Center(
          child: ListView(
            children: [
              Homedata(),
              SizedBox(
                height: 10,
              ),

              SizedBox(
                height: 10,
              ),
              //satır 1
              Container(
                padding: EdgeInsets.only(top: 150, left: 50, right: 50),
                child: Material(
                  elevation: 5.0,
                  borderRadius: BorderRadius.circular(15.0),
                  color: Colors.grey[200],
                  child: MaterialButton(
                    height: 75,
                    minWidth: MediaQuery.of(context).size.width,
                    onPressed: () {
                      showAlertDialog(context);
                    },
                    child: Text(
                      "START",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black,
                          fontStyle: FontStyle.normal,
                          fontSize: 25),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 100,
              ),
            ],
          ),
        ),
      ),
    );
  }

  showAlertDialog(BuildContext context) {
    // set up the buttons
    Widget continueButton = FlatButton(
      child: Text("Try Again"),
      onPressed: () {
        Navigator.pop(context);
        showAlertDialog(context);
      },
    );
    Widget cancelButton = FlatButton(
        child: Text("Close"),
        onPressed: () {
          Navigator.pop(context);
        });

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Scratch & Win"),
      content: Scratchcard(),
      actions: [
        continueButton,
        cancelButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
