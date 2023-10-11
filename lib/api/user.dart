import 'package:http/http.dart' as http;
import 'dart:convert';

class UserDB {
  final int _port = 3000;
  final String _host = 'http://localhost';
  String _serv = '';

  UserDB() {
    _serv = '$_host:$_port';
  }

  get serv => _serv;

  Future<List<dynamic>> _getData(String path) async {
    List<dynamic> listUsers =
        await http.get(Uri.parse('$_serv$path')).then((response) {
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

  Future<List<dynamic>> getUserById(int id) async =>
      await _getData('/getUserById?id=$id');

  Future<List<dynamic>> getAllImages(int userId) async =>
      await _getData('/allImages?id=$userId');

  Future<List<dynamic>> getImageById(int imageId) async =>
      await _getData('/imageById?id=$imageId');

  /* etc */
}

UserDB usrDB = UserDB();
