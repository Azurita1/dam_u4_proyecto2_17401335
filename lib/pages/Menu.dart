
import 'package:dam_u4_proyecto2_17401335/Asignacion.dart';
import 'package:dam_u4_proyecto2_17401335/pages/Consulta1.dart';
import 'package:dam_u4_proyecto2_17401335/pages/Consultas.dart';
import 'package:flutter/material.dart';

class Aplicacion5 extends StatefulWidget{
  @override
  State<StatefulWidget>createState(){
    return _Aplicacion5();
  }
}
class _Aplicacion5 extends State<Aplicacion5>{
  int _indice= 0; // Para poder cambiar la barra dependiendo del icono que seleccionemos

  void _cambiarIndice(int indice){
    setState((){
      _indice = indice;
    });
  }
  final List<Widget>_paginas = [ // Creación de vector
    Asignacion(),
    Consultas(),
  ];
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: _indice ==1 ? Colors.yellow[200] : Colors.white,
      //appBar: AppBar(title: const Text("Aplicacion 5")),
      body: _paginas[_indice],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Inicio"),
          BottomNavigationBarItem(icon: Icon(Icons.question_answer),label: "Consultas"),
        ],
        currentIndex: _indice,
        showUnselectedLabels: false,
        iconSize: 30,
        backgroundColor: Colors.amber,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white38,
        onTap: _cambiarIndice,
      ),
    );
  }
}