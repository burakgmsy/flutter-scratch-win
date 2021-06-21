import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Homedata extends StatefulWidget {
  Homedata({Key key}) : super(key: key);

  @override
  _HomedataState createState() => _HomedataState();
}

class _HomedataState extends State<Homedata> {
  var x;
  bool odulver = false;

  @override
  Widget build(BuildContext context) {
    //firebase connection
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
        //wallet widget 
        return Card(
          color: Colors.white,
          child: Container(
            width: 375,
            height: 75,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    color: Colors.grey[200],
                    width: 150,
                    height: 60,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.account_balance_wallet),
                        SizedBox(
                          width: 10,
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(60),
                          child: Container(
                            color: Colors.white,
                            width: 90,
                            height: 40,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  snapshot.data.data()['coin'].toString(),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    // add free coin 
                    if (snapshot.data.data()['coin'] < 50) {
                      print(snapshot.data.data()['coin'] + 250);
                      users
                          .doc(auth.currentUser.uid)
                          .update({'coin': snapshot.data.data()['coin'] + 250})
                          .then((value) => print("User Updated"))
                          .catchError((error) =>
                              print("Failed to update user: $error"));

                      showAlertDialog(
                          context, "250 coins added to your balance");
                    } else {
                      showAlertDialog(context, "balance is sufficient");
                    }
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      color: Colors.grey[200],
                      width: 80,
                      height: 60,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [Icon(Icons.monetization_on), Text("+250")],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

//alert widget
  showAlertDialog(BuildContext context, String value) {
    Widget cancelButton = FlatButton(
        child: Text("Close"),
        onPressed: () {
          Navigator.pop(context);
        });

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Scratch & Win"),
      content: Text(value),
      actions: [
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
