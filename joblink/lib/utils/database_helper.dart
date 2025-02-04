import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../modelos/users_models.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  static Database? _database;

  factory DatabaseHelper() {
    return _instance;
  }

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final path = join(await getDatabasesPath(), 'joblink.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }
}

Future<void> _onCreate(Database db, int version) async {
  await db.execute('''
    CREATE TABLE Usuario (
      id TEXT PRIMARY KEY,
      name TEXT,
      email TEXT,
      password TEXT,
      phone TEXT,
      tipoUsuario TEXT,
      dataPublicacao TEXT,
      especialidade TEXT,
      dataCadastro TEXT,
      localizacao TEXT
    )
  ''');

  await db.execute('''
    CREATE TABLE Trabalho (
      id TEXT PRIMARY KEY,
      titulo TEXT,
      descricao TEXT,
      localizacao TEXT,
      categoria TEXT,
      orcamento TEXT,
      dataCriacao TEXT,
      dataLimite TEXT,
      propostas TEXT,
      prazo TEXT,
      status TEXT,
      cidadaoId TEXT
    )
  ''');

  await db.execute('''
    CREATE TABLE Proposta (
      id TEXT PRIMARY KEY,
      valor TEXT,
      descricao TEXT,
      cidadaoId TEXT,
      freeLancerId TEXT,
      dataProposta TEXT,
      status TEXT
    )
  ''');

}
