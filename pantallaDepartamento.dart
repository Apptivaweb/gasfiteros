import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gasfitero/Departamento.dart';
import 'package:gasfitero/pantallaProvincia.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'api.dart';

class pantallaDepartamento extends StatefulWidget {
  const pantallaDepartamento({Key? key}) : super(key: key);

  @override
  State<pantallaDepartamento> createState() => _pantallaDepartamentoState();
}

class _pantallaDepartamentoState extends State<pantallaDepartamento> {
  List<Departamento> lista = [];
  bool isLoading = true;
  _getData() async {
    var data = {"departamento": null};
    var respuesta = await Servicio().getData("v2/departamento");
    var body = json.decode(respuesta.body);
    for(int i = 0; i < body.length; i++){
      lista.add(Departamento(body[i]['id'], body[i]['nombre']));
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
      body: Container(
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
                    //print(lista[index].nombre);
                    SharedPreferences config = await SharedPreferences.getInstance();
                    config.setInt("departamento",lista[index].id);
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => pantallaProvincia())
                    );
                  },
                )
              ],
            );
        }),
      ),
    );
  }
}
