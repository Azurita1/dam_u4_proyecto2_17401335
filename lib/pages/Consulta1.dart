import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dam_u4_proyecto2_17401335/services/firebase_services.dart';
import 'package:flutter/material.dart';

class Consulta1 extends StatefulWidget {
  const Consulta1({Key? key}) : super(key: key);

  @override
  State<Consulta1> createState() => _Consulta1State();
}

class _Consulta1State extends State<Consulta1> {
  TextEditingController docenteC = TextEditingController();
  Future<List<Map<String, dynamic>>>? asistenciaFuture;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Consultar asistencia por docente"),),
      body: Padding(
        padding: EdgeInsets.all(60),
        child: Column(
          children: <Widget>[
            TextField(decoration: InputDecoration(labelText: "Docente"),
            controller: docenteC,autofocus: true,),
            SizedBox(height: 30,),
            //Padding(padding: EdgeInsets.all(30)),
            ElevatedButton(onPressed: (){
              setState(() {
                asistenciaFuture = getConsulta1(docenteC.text);
              });
            }, child: Text("Buscar")),
            SizedBox(height: 30,),
            Expanded(child: FutureBuilder<List<Map<String,dynamic>>>(
              future: asistenciaFuture,
              builder: (context,snapshot){
                if(snapshot.connectionState==ConnectionState.waiting){
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }else if(snapshot.hasError){
                  return const Center(
                    child: Text("ERROR, FALLA EN LA CONEXIÓN"),
                  );
                }else{
                  final asistencias = snapshot.data??[];
                  return ListView.builder(
                      itemCount:asistencias.length,
                      itemBuilder: (context,index){
                        final asistencia = asistencias[index];
                        return ListTile(
                          title:Text('Fecha/hora: ${(asistencia['fecha/hora'])}') ,
                          subtitle: Text('Revisor: ${asistencia['revisor']}'),
                          );

                      });
                }
              }
            ))
          ],
        ),
      ),
    );
  }
}

