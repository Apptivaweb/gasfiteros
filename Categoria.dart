class Categoria{
  int id;
  String nombre;

  Categoria(this.id, this.nombre);
  int get _id => id;
  String get _nombre => nombre;

  Map<String, dynamic> toMap(){
    var map = new Map<String, dynamic>();
    map['id'] = id;
    map['nombre'] = nombre;
    return map;
  }
}