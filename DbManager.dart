import 'package:gasfitero/Categoria.dart';
import 'package:gasfitero/Departamento.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DbManager {
  static Future<Database> _db() async {
    return openDatabase(join(await getDatabasesPath(), 'gasfitero.db'),
        onCreate: (db, version) => _createDb(db), version: 1);
  }
  static void _createDb(Database db) {
    db.execute('CREATE TABLE categoria(id INTEGER, nombre TEXT)');
    db.execute('CREATE TABLE departamento(id INTEGER, nombre TEXT)');
  }

  // CATEGORIAS
  static Future<int> insertCategoria(Categoria categoria) async {
    Database database = await _db();
    return database.insert("categoria", categoria.toMap());
  }

  static Future<List<Categoria>> getCategorias(String condicion) async{
    Database database = await _db();
    List<Map> lista   = await database.rawQuery("SELECT * FROM categoria WHERE $condicion");
    List<Categoria> listacategoria = [];
    for (int i = 0; i < lista.length; i++) {
      listacategoria.add(Categoria(
          lista[i]["id"],
          lista[i]["nombre"]
      ));
    }
    return listacategoria;
  }


  static Future<int> insertProducto(Departamento producto) async {
    Database database = await _db();
    return database.insert("departamento", producto.toMap());
  }



  static Future<List<Departamento>> getProductos(String condicion) async {
    Database database = await _db();
    List<Map> lista =
    await database.rawQuery("SELECT * FROM departamento WHERE " + condicion);
    List<Departamento> modelo = [];
    for (int i = 0; i < lista.length; i++) {
      modelo.add(new Departamento(
          lista[i]["id"],
          lista[i]["nombre"]
          ));
    }
    return modelo;
  }


  static Future<int> delete(Departamento producto) async {
    Database database = await _db();
    return database.delete("departamento", where: "id = ?", whereArgs: [producto.id]);
  }
  static Future<int> deleteTable(String tabla, String condicion) async{
    Database database = await _db();
    return await database.rawDelete("DELETE FROM "+tabla+" WHERE "+condicion);
  }
  static Future<int> update(Departamento producto) async {
    Database database = await _db();
    return database.update("animales", producto.toMap(), where: "id = ?", whereArgs: [producto.id]);
  }

}
