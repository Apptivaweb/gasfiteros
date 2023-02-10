import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:gasfitero/Categoria.dart';
import 'package:gasfitero/DbManager.dart';
import 'package:gasfitero/api.dart';
import 'package:gasfitero/pantallaDepartamento.dart';
import 'package:gasfitero/pantallaEmpresas.dart';
import 'package:shared_preferences/shared_preferences.dart';

class pantallaCategoria extends StatefulWidget {
  const pantallaCategoria({Key? key}) : super(key: key);

  @override
  State<pantallaCategoria> createState() => _pantallaCategoriaState();
}

class _pantallaCategoriaState extends State<pantallaCategoria> {

  Future _verificarConfig() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int provincia = prefs.getInt("provincia") ?? 0;
    if (provincia==0){
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => pantallaDepartamento())
      );
    }
  }

  bool isLoading = true;
  _getData() async {
    var respuesta = await Servicio().getData("v2/categoria");
    var body = json.decode(respuesta.body);
    DbManager.deleteTable("categoria", "1");
    for(int i = 0; i < body.length; i++){
      DbManager.insertCategoria(Categoria(body[i]['id'], body[i]['nombre']));
      //print(body[i]['id']);
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _verificarConfig();
    _getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("SERVICIOS"),),
      backgroundColor: Colors.red,
      body: Center(
        child: isLoading
        ? const CircularProgressIndicator(
          backgroundColor: Colors.white,
          strokeWidth: 10,
        )
        : FutureBuilder(
      future: DbManager.getCategorias("1"),
      builder: (context,data){
        if(data.hasData){
          return GridView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: MediaQuery.of(context).size.width/(MediaQuery.of(context).size.height/2)
              ),
              itemCount: data.data?.length ?? 0 ,
              itemBuilder: (c,i){
                return InkWell(
                  child: Container(
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Text(data.data![i].nombre, style: TextStyle(fontSize: 20),),
                    ),
                  ),
                  onTap: (){
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => pantallaEmpresas())
                    );
                  },
                );
              }
          );
        }else{
          return const Center(child: Text("Loading"));
        }
      },
    ),
      ),
    );
  }
}
