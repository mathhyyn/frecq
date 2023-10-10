import 'package:http/http.dart' as http;
import 'dart:convert';

class UserDB {
  const UserDB();

  Future<List<dynamic>> _getData(String path) async {
    List<dynamic> listUsers = await http
        .get(Uri.parse('http://localhost:3000$path'))
        .then((response) {
      return json.decode(response.body);
    }).catchError((error) {
      // ignore: avoid_print
      print("Error: $error");
      return [];
    });
    return listUsers;
  }

  /* requests: */
  Future<List<dynamic>> getAllUsers() async => await _getData('/allUsers');

  /* для получения данных: 
  import '../api/user.dart' show usrDB; 
  .. 
  var data = await db.getAllUsers();
  */

  /* etc */
}

UserDB usrDB = const UserDB();
