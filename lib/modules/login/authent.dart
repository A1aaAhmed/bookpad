import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
///flutter run -d chrome --web-hostname localhost --web-port 3000
final authProvider=Provider((ref) => AuthRepo(
    googleSinIn:GoogleSignIn()),);
class AuthRepo{
  final GoogleSignIn _googleSinIn; // private
  AuthRepo( {required GoogleSignIn googleSinIn,}):_googleSinIn=googleSinIn;
  // make the sign in a private access the scope of it only here
  void signInWithGoogle()async{
    try{
   final user =  await _googleSinIn.signIn();
   if (user!= null){
     print(user.email);
     print(user.displayName);


   }

    }
    catch (e){
      print(e);
    }

  }

}
