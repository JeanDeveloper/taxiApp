import 'package:firebase_auth/firebase_auth.dart';
import 'package:taxi/app/domain/entities/driver.dart';
import 'package:taxi/app/domain/entities/iuser.dart';

abstract class ILocalStorageDataSource{
  Future<IUser?> getUser(String userCode);
}

class LocalStorageDataSource extends ILocalStorageDataSource{

  final _auth = FirebaseAuth.instance;

  @override
  Future<IUser?> getUser(String userCode) async {

    final User? user =  _auth.currentUser;

    if( user != null ){
      return Driver(
        uid: user.uid, 
        name: user.displayName?? "", 
      );
    }
    return null;

  }

}
