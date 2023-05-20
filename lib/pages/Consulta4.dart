import 'package:dam_u4_proyecto2_17401335/services/firebase_services.dart';
import 'package:flutter/material.dart';

class Consulta4 extends StatefulWidget {
  const Consulta4({Key? key}) : super(key: key);

  @override
  State<Consulta4> createState() => _Consulta4State();
}

class _Consulta4State extends State<Consulta4> {
  TextEditingController revisorC = TextEditingController();
  Future<List<Map<String, dynamic>>>? asistenciaFuture;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Consulta 4"),),
      body: Padding(
        padding: EdgeInsets.all(30),
        child: Column(
          children: <Widget>[
            TextField(decoration: InputDecoration(labelText: "Revisor"),
            controller: revisorC,autofocus: true,),
            SizedBox(height: 30,),
            ElevatedButton(onPressed: (){
              setState(() {
                asistenciaFuture = getConsulta4(revisorC.text);
              });
            }, child: const Text("Buscar")),
            SizedBox(height: 30,),
            Expanded(child: FutureBuilder<List<Map<String,dynamic>>>(
              future: asistenciaFuture,
              builder:(context,snapshot){
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
              } ,))
          ],
        ),
      ),
    );
  }
}
