import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:seminar_hall_booking/model/user.dart';
import 'model/seminar_hall.dart';

class FirebaseServices {
  FirebaseFirestore _fireStoreDataBase = FirebaseFirestore.instance;

  //retrieve the data
  Stream<List<Seminar>> getDataList() {
    return _fireStoreDataBase.collection('seminarhalls').snapshots().map(
        (snapShot) => snapShot.docs
            .map((document) => Seminar.fromJson(document.data(), document.id))
            .toList());
  }

  //upload a data
  Future<void> addData(Seminar seminarData) async {
    await _fireStoreDataBase
        .collection('seminarhalls')
        .add(seminarData.toJson());
  }

  Future<void> updateData(Seminar seminarData) async {
    await _fireStoreDataBase
        .collection('seminarhalls')
        .doc(seminarData.docId)
        .update(seminarData.toJson());
  }

  Future<void> addUser(UserModel user) async {
    //DocumentReference docRef =
    await _fireStoreDataBase
        .collection('users')
        .doc(user.email)
        .set(user.toJson());
  }


  Future<UserModel> getUser(String email) async {
    DocumentReference docRef =
        _fireStoreDataBase.collection('users').doc(email);
    DocumentSnapshot snapshot = await docRef.get();
    UserModel user;
    if (snapshot.data().isNotEmpty) {
      user = UserModel.fromJson(snapshot.data());
    }
    return user;
  }

  Future<UserModel> getAdmin(String email) async {
    DocumentReference docRef =
    _fireStoreDataBase.collection('admin').doc(email);
    DocumentSnapshot snapshot = await docRef.get();
    UserModel user;
    if (snapshot.data().isNotEmpty) {
      user = UserModel.fromJson(snapshot.data());
    }
    return user;
  }

}