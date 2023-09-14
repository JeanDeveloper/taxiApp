import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:taxi/app/core/constants/constants.dart';
import 'package:taxi/app/domain/entities/driver.dart';
import 'package:taxi/app/domain/entities/iuser.dart';
import 'package:taxi/driver/data/models/jean_user_model.dart';

abstract class ILocalStorageDataSource{
  Future<IUser?> getUser();

}

class LocalStorageDataSource extends ILocalStorageDataSource{

  final _auth = FirebaseAuth.instance;
  final _db   = FirebaseFirestore.instance;
  

  @override
  Future<IUser?> getUser() async {

    final User? user =  _auth.currentUser;

    if( user != null ){

      final  driver = await getUserFromFirestore(user.uid);
      return driver;

    }
    return null;

  }
  Future<Driver?> getUserFromFirestore(String id) async {

    final userUid = await _db.collection("users").where('uid', isEqualTo: id).get();

    if(userUid.docs.isNotEmpty){
      final uuid = userUid.docs.first.id; 
      final user = await _db.collection("users").doc(uuid).get();
      final payout = await _db.collection("users").doc(uuid).collection("payout").get();

      final jeanUser = jeanUserModelFromFirestore(user);

      final payoutUser = jeanPayoutModelFromFirestore(payout.docs.first);

      final driver = Driver(
        uid: id,
        address: jeanUser.address,
        document: jeanUser.document,
        documentPath: jeanUser.documentPath,
        email: jeanUser.email,
        gender: Constants.genders.where((gender) => gender.code == jeanUser.genderId).first,
        isActive: jeanUser.isActive,
        licensePath: jeanUser.licensePath,
        name: jeanUser.name,
        phone: jeanUser.phone,
        photoPath: jeanUser.photoPath,
        surname: jeanUser.surname,
        userType: jeanUser.userType,
        payout: payoutUser,
      );


      return driver;

    }
    return null;
  }
}
