import 'package:flutter/material.dart';
import 'package:flutterscratchwin/data/data.dart';
import 'package:scratcher/scratcher.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Scratchcard extends StatefulWidget {
  @override
  _ScratchcardState createState() => _ScratchcardState();
}

class _ScratchcardState extends State<Scratchcard> {
  @override
  Widget build(BuildContext context) {
    Data data = Data();
    data.randomdata();
    String kazan = "Win";
    String kayip = "Lose";
    String bakiye = "Insufficient Balance ";
    String durum = " ";
    bool control = true;
    var wintrack = 0;
    double kazikazankare = 60;
    FirebaseAuth auth = FirebaseAuth.instance;

    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('users')
          .doc(auth.currentUser.uid)
          .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return CircularProgressIndicator();
        }
        CollectionReference users =
            FirebaseFirestore.instance.collection('users');
        if (control) {
          if (snapshot.data.data()['coin'] < 50) {
            control = false;
            return Container(
              child: Text(bakiye),
            );
          }
        }
        if (control) {
          if (snapshot.data.data()['coin'] >= 50) {
            users
                .doc(auth.currentUser.uid)
                .update({'coin': snapshot.data.data()['coin'] + -50})
                .then((value) => print("User Updated"))
                .catchError((error) => print("Failed to update user: $error"));
            control = false;
          }
        }

        winclock() {
          wintrack++;
          print(wintrack);
          if (wintrack == 6) {
            if (data.win == true) {
              print(kazan);
              durum = "Win";
              showAlertDialog(context, durum);
              for (var j = 0; j < data.data3.length; j++) {
                if (data.data3[j] == 3) {
                  users
                      .doc(auth.currentUser.uid)
                      .update({
                        'coin': snapshot.data.data()['coin'] + (data.data2[j])
                      })
                      .then((value) => print("User Updated"))
                      .catchError(
                          (error) => print("Failed to update user: $error"));
                  break;
                }
              }
            }
            if (data.win == null) {
              print(kayip);
              durum = "Lose";
              showAlertDialog(context, durum);
            }
          }
        }

        return Container(
          height: 450,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Colors.greenAccent,
            image: DecorationImage(
              /* colorFilter: new ColorFilter.mode(
                  Colors.black.withOpacity(0.1), BlendMode.dstATop),*/
              image: NetworkImage("https://i.resmim.net/DuboC.png"),
              fit: BoxFit.fill,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //
              //
              Card(
                child:
                    Text("Wallet: " + snapshot.data.data()['coin'].toString()),
              ),
              SizedBox(
                height: 170,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Scratcher(
                    brushSize: 15,
                    threshold: 80,
                    onThreshold: () => winclock(),
                    accuracy: ScratchAccuracy.medium,
                    color: Colors.grey,
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                        width: 1,
                      )),
                      height: kazikazankare,
                      width: kazikazankare,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("${data.num1.toString()}"),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Scratcher(
                    brushSize: 15,
                    threshold: 80,
                    onThreshold: () => winclock(),
                    color: Colors.grey,
                    accuracy: ScratchAccuracy.medium,
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                        width: 1,
                      )),
                      height: kazikazankare,
                      width: kazikazankare,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("${data.num2.toString()}"),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Scratcher(
                    brushSize: 15,
                    threshold: 80,
                    color: Colors.grey,
                    onThreshold: () => winclock(),
                    accuracy: ScratchAccuracy.medium,
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                        width: 1,
                      )),
                      height: kazikazankare,
                      width: kazikazankare,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("${data.num3.toString()}"),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Scratcher(
                    brushSize: 15,
                    threshold: 80,
                    onThreshold: () => winclock(),
                    color: Colors.grey,
                    accuracy: ScratchAccuracy.medium,
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                        width: 1,
                      )),
                      height: kazikazankare,
                      width: kazikazankare,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("${data.num4.toString()}"),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Scratcher(
                    brushSize: 15,
                    threshold: 80,
                    onThreshold: () => winclock(),
                    color: Colors.grey,
                    accuracy: ScratchAccuracy.medium,
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                        width: 1,
                      )),
                      height: kazikazankare,
                      width: kazikazankare,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("${data.num5.toString()}"),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Scratcher(
                    brushSize: 15,
                    threshold: 80,
                    onThreshold: () => winclock(),
                    color: Colors.grey,
                    accuracy: ScratchAccuracy.medium,
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                        width: 1,
                      )),
                      height: kazikazankare,
                      width: kazikazankare,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("${data.num6.toString()}"),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  showAlertDialog(BuildContext context, String x) {
    Widget closeButton = FlatButton(
      child: Text("Close"),
      onPressed: () => Navigator.pop(context),
    );

    AlertDialog alert = AlertDialog(
      title: Text("Scratch & Win"),
      content: Container(
        child: Text(x),
      ),
      actions: [
        closeButton,
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
