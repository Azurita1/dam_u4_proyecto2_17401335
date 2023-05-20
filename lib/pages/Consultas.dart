import 'package:dam_u4_proyecto2_17401335/pages/Consulta1.dart';
import 'package:flutter/material.dart';

class Consultas extends StatefulWidget {
  const Consultas({Key? key}) : super(key: key);

  @override
  State<Consultas> createState() => _ConsultasState();
}

class _ConsultasState extends State<Consultas> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Consultas"),),
      body: ListView(
        padding: EdgeInsets.all(60),
        children: [
          TextButton(onPressed: (){
            Navigator.pushNamed(context, '/consulta1');
          }, child: const Text("Consulta 1")),
          SizedBox(height: 30,),
          TextButton(onPressed: (){
            Navigator.pushNamed(context, '/consulta2');
          }, child: const Text("Consulta 2")),
          SizedBox(height: 30,),
          TextButton(onPressed: (){
            Navigator.pushNamed(context, '/consulta22');
          }, child: const Text("Consulta 3")),
          SizedBox(height: 30,),
          TextButton(onPressed: (){
            Navigator.pushNamed(context, '/consulta4');
          }, child: const Text("Consulta 4")),
          SizedBox(height: 30,),
        ],
      ),
    );
  }
}
