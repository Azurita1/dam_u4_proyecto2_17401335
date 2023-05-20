import 'package:dam_u4_proyecto2_17401335/services/firebase_services.dart';
import 'package:flutter/material.dart';

class Consulta2 extends StatefulWidget {
  const Consulta2({Key? key}) : super(key: key);

  @override
  State<Consulta2> createState() => _Consulta2State();
}

class _Consulta2State extends State<Consulta2> {
  TextEditingController dato1 = TextEditingController();
  TextEditingController dato2 = TextEditingController();
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
              controller: dato1,autofocus: true,),
            SizedBox(height: 30,),
            TextField(decoration: InputDecoration(labelText: "Docente"),
              controller: dato2,autofocus: true,),
            SizedBox(height: 30,),
            ElevatedButton(onPressed: (){
              setState(() {
                asistenciaFuture = getConsulta2(dato1.text,dato2.text);
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
                            title:Text('Fecha/hora: ${(asistencia['edificio'])}') ,
                            //subtitle: Text('Revisor: ${asistencia['revisor']}'),
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
