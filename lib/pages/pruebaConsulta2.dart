import 'package:dam_u4_proyecto2_17401335/services/firebase_services.dart';
import 'package:flutter/material.dart';

class Cosnulta2P extends StatefulWidget {
  const Cosnulta2P({Key? key}) : super(key: key);

  @override
  State<Cosnulta2P> createState() => _Cosnulta2PState();
}

class _Cosnulta2PState extends State<Cosnulta2P> {
  TextEditingController fechaInicioC = TextEditingController();
  TextEditingController fechaFinC = TextEditingController();
  TextEditingController deptoC = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Consulta2"),),
      body:FutureBuilder(
          future:getAsistenciasxFD(fechaInicioC.text,fechaFinC.text),
          builder: (context,snapshot){Column(children: [TextField(decoration: InputDecoration(labelText: "Primer dato"),
            controller: fechaInicioC,autofocus: true,),
            SizedBox(height: 30,),
            TextField(decoration: InputDecoration(labelText: "Primer dato"),
              controller: fechaFinC,autofocus: true,),
            TextButton(onPressed: (){
              setState(() {
                getAsistenciasxFD(fechaInicioC.text, fechaFinC.text);
              });
            },child: const Text("Guardar"),),
            SizedBox(height: 30,),],);
            if(snapshot.hasData){
              return ListView.builder(
                  itemCount:snapshot.data?.length,
                  itemBuilder: (context,index){
                    return ListTile(
                        title: Text(snapshot.data?[index]['revisor'],
                            style:TextStyle(fontWeight: FontWeight.bold)),
                        subtitle:Row(
                          children: [
                            Text(snapshot.data?[index]['fecha']),
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
    );
  }
}
