import 'package:cloud_firestore/cloud_firestore.dart';

//firebase_firestore
class DatabaseService {
  final String uid;
  DatabaseService({this.uid});
  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection("users");

  Future updateUserData(int coin) async {
    return await userCollection.doc(uid).set({
      "coin": coin,
    });
  }
}
