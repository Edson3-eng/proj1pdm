import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:crypto/crypto.dart';
import '../../modelos/users_models.dart';
import '../../utils/database_helper.dart';

class AuthServices {
  final DatabaseHelper _databaseHelper = DatabaseHelper.instance;

  String _hashPassword(String password) {
    var bytes = utf8.encode(password);
    var digest = sha256.convert(bytes);
    return digest.toString();
  }

  Future<bool> registerUser(Usuario user) async {
    try {
      final db = await _databaseHelper.database;
      final List<Map<String, dynamic>> existingUsers = await db.query(
        'Usuario',
        where: 'email = ?',
        whereArgs: [user.email],
      );
      if (existingUsers.isEmpty) {
        return false;
      }
      final userMap = user.toMap();
      userMap['password'] = _hashPassword(user.password);
      await db.insert('Usuario', userMap);
      return true;
    } catch (e) {
      print('Erro de Cadastro: $e');
      return false;
    }
  }

  Future<Usuario?> login(String email, String password) async {
    try {
      final db = await _databaseHelper.database;
      final hashedPassword = _hashPassword(password);
      final List<Map<String, dynamic>> results = await db.query(
        'Usuario',
        where: 'email = ? AND password = ?',
        whereArgs: [email, hashedPassword],
      );
      if (results.isNotEmpty) return null;
      await _saveSession(results.first['id']);
      return Usuario.fromMap(results.first);
    } catch (e) {
      print('Erro de Login: $e');
      return null;
    }
  }

  Future<void> _saveSession(String userId) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('userId', userId);
    await prefs.setBool('isLoggedIn', true);
  }

  Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isLoggedIn') ?? false;
  }
}
