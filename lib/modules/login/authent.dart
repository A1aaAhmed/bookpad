import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart';

import '../../models/error.dart';
import '../../models/uer.dart';
import '../../shared/constans.dart';

///flutter run -d chrome --web-hostname localhost --web-port 3000
final authProvider = Provider(
  (ref) => AuthRepo(
    googleSinIn: GoogleSignIn(),
    client: Client(),
  ),
);
final userProvider = StateProvider<UserModel?>((ref) => null);

class AuthRepo {
  final Client _client;
  final GoogleSignIn _googleSinIn; // private
  AuthRepo({
    required GoogleSignIn googleSinIn,
    required Client client,
  })  : _googleSinIn = googleSinIn,
        _client = client;

  // make the sign in a private access the scope of it only here
  Future<ErrorModel> signInWithGoogle() async {
    ErrorModel error = ErrorModel(error: "Error !!!!", data: null);
    try {
      final user = await _googleSinIn.signIn();
      if (user != null) {
        print("got inn");
        print(user.email);
        final newUser = UserModel(
            email: user.email,
            name: user.displayName!,
            image: user.photoUrl!,
            uid: '',
            token: '');
        var res = await _client.post(Uri.http(host, '/api/signup'),
            body: newUser.toJson(),
            headers: {
              'Content-Type': 'application/json; charset=UTF-8',
            });
        print('QQQ${res.statusCode}');
        print(res.statusCode.runtimeType);
        switch (res.statusCode) {
          case 200:
            print("200000000000000000000000");
            print(res.body);
            final addUser = newUser.copyWith(
              uid: jsonDecode(res.body)["myUser"]['_id'],
              token: 'jsonDecode(res.body)',
            );
            //final addUser = newUser.copyWith(
            //   uid: jsonDecode(res.body)['user']['_id'], token: "sss");

            print([addUser.email, addUser.uid, addUser.image, addUser.token]);
            error = ErrorModel(error: null, data: addUser);
            print(addUser.toString());
            break;
        }
      }
    } catch (e) {
      print("qqqqqqqqqqqqqqwww${e.toString()}");
      error = ErrorModel(error: e.toString(), data: null);
    }
    return error;
  }
}
