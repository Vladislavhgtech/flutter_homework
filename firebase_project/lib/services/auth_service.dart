import 'package:firebase_auth/firebase_auth.dart';


class AuthService{
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  User user;
  User _updateUser;

  Future<User> signUp(String email, String password) async{
    try {
      return user = (await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password)).user;
    }catch(e){
      print('$e');
    }
  }

  Future<User> signIn(String email, String password) async{
    try{
      return  user = (await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password)).user;
    }catch(e) {
      print('$e');
    }
  }

  Future<User> getCurrentUser() async{
    return user = await _firebaseAuth.currentUser;
  }

  Future<void> signOut(){
    return _firebaseAuth.signOut();
  }

  Future<User> updateUserPhoto(String photoUrl) async{
    user = await _firebaseAuth.currentUser;
    // print("photoUrlUpdate -- ${photoUrl}");
    await user.updatePhotoURL(photoUrl);
    await user.reload();
    _updateUser = await _firebaseAuth.currentUser;
    await user.reload();
    _updateUser = await _firebaseAuth.currentUser;
    // print("user321654 -- ${user}");
    return _updateUser;
  }

  Future<User> emailVerification() async{
    user = await _firebaseAuth.currentUser;
    await user.sendEmailVerification();
  }





}