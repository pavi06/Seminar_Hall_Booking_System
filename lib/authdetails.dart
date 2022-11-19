import 'package:firebase_auth/firebase_auth.dart';
//import 'package:seminar_hall_booking/model/user.dart';

class AuthService {
  final FirebaseAuth _authService = FirebaseAuth.instance;

  Future<void> resetPasswordWithEmail(String emailAddress) async{
    try{
      var result =await _authService.sendPasswordResetEmail(email: emailAddress);
    }catch(e){
      print(e.toString());
    }
  }

  Future<User> createWithEmail(String emailAddress, String pass) async{
    try{
      var result = await _authService.createUserWithEmailAndPassword(email: emailAddress, password: pass);
      User user =result.user;
      //print(user.email);
      return user;
    }catch(e){
      print(e.toString());
      return null;
    }
  }

  Future<User> signInWithEmail(String emailAddress, String pass) async{
    try{
      var result =await _authService.signInWithEmailAndPassword(email: emailAddress, password: pass);
      User user =result.user;
      //print(user.email);
      return user;
    }catch(e){
      print(e.toString());
      return null;
    }
  }

}
