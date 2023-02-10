import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gasfitero/Provincia.dart';
import 'package:gasfitero/api.dart';
import 'package:gasfitero/pantallaCategoria.dart';
import 'package:shared_preferences/shared_preferences.dart';

class pantallaProvincia extends StatefulWidget {
  const pantallaProvincia({Key? key}) : super(key: key);

  @override
  State<pantallaProvincia> createState() => _pantallaProvinciaState();
}

class _pantallaProvinciaState extends State<pantallaProvincia> {
  List<Provincia> lista = [];
  bool isLoading = true;
  _getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var id = prefs.getInt("departamento");
    var respuesta = await Servicio().getData("v2/provincia?id="+id.toString());
    var body = json.decode(respuesta.body);
    for(int i = 0; i < body.length; i++){
      print(body[i]['nombre']);
      lista.add(Provincia(body[i]['id'], body[i]['nombre']));
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
      body: Container(
        alignment: Alignment.centerLeft,
        child: ListView.builder(
            shrinkWrap: true,
            itemCount: lista.length,
            itemBuilder: (BuildContext context, int index){
              return Column(
                children: [
                  InkWell(
                    child: Container(
                      decoration: const BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.all(
                              Radius.circular(5.0))
                      ),
                      margin: const EdgeInsets.all(5),
                      padding: const EdgeInsets.all(15),
                      alignment: Alignment.center,
                      child: Text(lista[index].nombre,style: const TextStyle(color: Colors.white),),
                    ),
                    onTap: () async {
                      SharedPreferences config = await SharedPreferences.getInstance();
                      config.setInt("provincia",lista[index].id);
                      Navigator.of(context).pushReplacement( MaterialPageRoute(builder: (context) => pantallaCategoria()));
                    },
                  )
                ],
              );
            }),
      ),
    );
  }
}
