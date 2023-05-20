import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dam_u4_proyecto2_17401335/pages/insertarAsistencia.dart';
import 'package:dam_u4_proyecto2_17401335/services/firebase_services.dart';
import 'package:flutter/material.dart';

class Asistencia extends StatefulWidget {
  final String asignacionId;
  const Asistencia({Key? key,required this.asignacionId}) : super(key: key);

  @override
  State<Asistencia> createState() => _AsistenciaState();
}

class _AsistenciaState extends State<Asistencia> {
  @override
  Widget build(BuildContext context) {
    String asignacionId = widget.asignacionId;
    return Scaffold(
      appBar: AppBar(title: Text("Asistencias")),
      body: FutureBuilder(
        future: getAsistencia(widget.asignacionId),
        builder: (context,snapshot){
          if(snapshot.hasData){
            return ListView.builder(
                itemCount:snapshot.data?.length,
                itemBuilder: (context,index){
                  return ListTile(
                    title: Text(snapshot.data?[index]['revisor']??''),
                    onTap: (()async{
                      setState(() {});
                    }),
                    subtitle: Row(
                      children: [
                        Text('Asistencia: ' +(snapshot.data?[index]['fecha/hora'] ?? ''))
                      ],
                    ),
                  );
            },);
        }else{
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        }
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: ()async{
          await Navigator.push(context, MaterialPageRoute(builder: (builder)=>InsertarAsistencia(asignacionId: asignacionId)));
          setState(() {});
        },child: Icon(Icons.add),
      ),
    );
  }
}
