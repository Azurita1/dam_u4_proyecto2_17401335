import 'package:dam_u4_proyecto2_17401335/pages/Asistencia.dart';
import 'package:dam_u4_proyecto2_17401335/pages/insertarAsistencia.dart';
import 'package:dam_u4_proyecto2_17401335/services/firebase_services.dart';
import 'package:flutter/material.dart';
// Importaciones de firebase
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

class Asignacion extends StatefulWidget {
  const Asignacion({Key? key}) : super(key: key);
  @override
  State<Asignacion> createState() => _AsignacionState();
}
class _AsignacionState extends State<Asignacion> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Asignación"),),
      body: FutureBuilder(
          future:getAsignacion(),
          builder: (context,snapshot){
            if(snapshot.hasData){
              return ListView.builder(
                  itemCount:snapshot.data?.length,
                  itemBuilder: (context,index){
                    return ListTile(
                      title: Text(snapshot.data?[index]['docente'],
                        style:TextStyle(fontWeight: FontWeight.bold)),
                      onTap: ((){
                        showDialog(context: context, builder: (builder){
                          return AlertDialog(
                            title: Text("ATENCIÓN"),
                            content: Text("¿Qué desea hacer con ${snapshot.data?[index]['materia']}"),
                            actions: [
                              TextButton(onPressed: ()async{
                                await Navigator.pushNamed(context, '/actualizarAsignacion',arguments:{
                                  "uid":snapshot.data?[index]['uid'],
                                  "docente":snapshot.data?[index]['docente'],
                                  "edificio":snapshot.data?[index]['edificio'],
                                  "horario":snapshot.data?[index]['horario'],
                                  "materia":snapshot.data?[index]['materia'],
                                  "salon":snapshot.data?[index]['salon'],
                                });
                                Navigator.pop(context);
                                setState(() {});
                              }, child: Text("Actualizar")),
                              TextButton(onPressed: ()async{
                                await deleteAsignacion(snapshot.data?[index]['uid']);
                                Navigator.pop(context);
                                setState(() {});
                              }, child: Text("Eliminar")),
                              TextButton(onPressed: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>
                                    Asistencia(asignacionId: snapshot.data?[index]['uid'])));
                              }, child: Text("Asistencia"))
                            ],
                          );
                        });
                      }),
                      subtitle:Row(
                        children: [
                          Text(
                              'Docente: ${snapshot.data?[index]['materia']}\n'
                              'Horario: ${snapshot.data?[index]['horario']} \n'
                              'Edificio: ${snapshot.data?[index]['edificio']}\n'
                              'Salon: ${snapshot.data?[index]['salon']}\n'
                          ),
                        ],
                      )
                    );
                  });
            }else{
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
        floatingActionButton: FloatingActionButton(
          onPressed: ()async{
            await Navigator.pushNamed(context, '/insertarAsignacion');
            setState(() {});
          },
          child: const Icon(Icons.add),
        ),
    );
  }
}
