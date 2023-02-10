class Departamento{
  int id;
  String nombre;

  Departamento(this.id, this.nombre);

  /*
  Producto.map(dynamic o){
    this.id = o["id"];
    this.nombre = o["nombre"];
    this.descripcion = o["descripcion"];
    this.precioventa = o["precioventa"];
    this.preciocompra = o["preciocompra"];
    this.urlfoto = o["urlfoto"];
    this.unidad = o["unidad"];
    this.cantidad = o["cantidad"];
  }
*/
  int get _id => id;
  String get _nombre => nombre;

  Map<String, dynamic> toMap(){
    var map = new Map<String, dynamic>();
    map['id'] = id;
    map['nombre'] = nombre;
    return map;
  }
}