class Empresa{
  int id;
  String nombre;
  String direccion;
  String celular;
  String link_web;
  String urllogo;


  Empresa(this.id, this.nombre, this.direccion, this.celular, this.link_web, this.urllogo);
  int get _id => id;
  String get _nombre => nombre;
  String get _direccion => direccion;
  String get _celular => celular;
  String get _link_web => link_web;
  String get _urllogo => urllogo;

  Map<String, dynamic> toMap(){
    var map = <String, dynamic>{};
    map['id'] = id;
    map['nombre'] = nombre;
    map['celular'] = celular;
    map['celular'] = celular;
    map['link_web'] = link_web;
    map['urllogo'] = urllogo;
    return map;
  }
}