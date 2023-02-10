import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:gasfitero/Empresa.dart';
import 'package:gasfitero/api.dart';
import 'package:shared_preferences/shared_preferences.dart';

class pantallaEmpresas extends StatefulWidget {
  const pantallaEmpresas({Key? key}) : super(key: key);

  @override
  State<pantallaEmpresas> createState() => _pantallaEmpresasState();
}

class _pantallaEmpresasState extends State<pantallaEmpresas> {
  bool isLoading = true;
  List<Empresa> lista = [];
  _getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int provincia = prefs.getInt("provincia") ?? 0;
    int categoria = prefs.getInt("categoria") ?? 0;

    var respuesta = await Servicio()
        .getData("v2/empresas?provincia_id=$provincia&categoria_id=$categoria");
    var body = json.decode(respuesta.body);
    print(body.toString());
    for (int i = 0; i < body.length; i++) {
      lista.add(Empresa(body[i]['id'], body[i]['nombre'], body[i]['direccion'],
          body[i]['celular'], body[i]['link_web'], body[i]['urllogo']));
      //print(body[i]['id']);
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    _getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red[500],
      body: Container(
        child: ListView.builder(
            shrinkWrap: true,
            itemCount: lista.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                elevation: 20,
                margin: EdgeInsets.all(10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Flexible(
                      child: Padding(
                        padding: EdgeInsets.all(5),
                        child: ClipRRect(
                          borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(10),
                              topLeft: Radius.circular(10)),
                          child: Image.network(
                              'https://gasfitero.app/img/logo/${lista[index].urllogo}',
                              fit: BoxFit.cover,
                              width: 100,
                              height: 100,
                              alignment: Alignment.center),
                        ),
                      ),
                    ),
                    Flexible(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          lista[index].nombre,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                        Text(lista[index].direccion),
                        Text(
                          lista[index].celular,
                          style: const TextStyle(fontWeight: FontWeight.w900),
                        )
                      ],
                    ))
                  ],
                ),
              );
            }),
      ),
    );
  }
}
