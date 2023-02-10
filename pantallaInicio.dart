import 'package:flutter/material.dart';
import 'package:gasfitero/pantallaCategoria.dart';
import 'package:gasfitero/dibujos.dart';

class pantallaInicio extends StatefulWidget {
  @override
  State<pantallaInicio> createState() => _pantallaInicioState();
}

class _pantallaInicioState extends State<pantallaInicio> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.redAccent[700],
        body: Container(
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: <Widget>[
              ClipPath(
                clipper: ClipImagen(),
                child: Container(
                  width: double.infinity,
                  height: 635,
                  decoration: BoxDecoration(color: Colors.white),
                ),
              ),
              ClipPath(
                clipper: ClipImagen(),
                child: Container(
                  width: double.infinity,
                  height: 420,
                  decoration: BoxDecoration(color: Color(0xFFFF0000)),
                ),
              ),
              Positioned(
                child: Align(
                  alignment: FractionalOffset.centerRight,
                  child: Container(
                      width: 30,
                      height: 500,
                      alignment: Alignment.centerRight,
                      decoration: const BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(190),
                              bottomLeft: Radius.circular(190))),
                      child: const RotatedBox(
                        quarterTurns: 3,
                        child: Padding(
                          padding: EdgeInsets.only(top: 1, left: 1, bottom: 0),
                          child: Text(
                            "GASFITEROS - ELECTRICISTAS - PINTORES",
                            style: TextStyle(
                                color: Colors.black87,
                                fontSize: 10,
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.w500,
                                letterSpacing: 8),
                          ),
                        ),
                      )),
                ),
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    const Text(
                      "gasfitero.app",
                      style: TextStyle(color: Colors.white, fontSize: 30),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "Cerca a tu hogar",
                      style: TextStyle(
                          color: Colors.white, fontSize: 15, letterSpacing: 4),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 300,
                    ),
                    FloatingActionButton(
                        backgroundColor: Colors.white,
                        child: const Icon(
                          Icons.chevron_right,
                          color: Colors.red,
                        ),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (BuildContext) => pantallaCategoria()));
                        })
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
