import 'package:dam_u4_proyecto2_17401335/services/firebase_services.dart';
import 'package:flutter/material.dart';

class ActualizarAsig extends StatefulWidget {
  const ActualizarAsig({Key? key}) : super(key: key);

  @override
  State<ActualizarAsig> createState() => _ActualizarAsigState();
}

class _ActualizarAsigState extends State<ActualizarAsig> {
  final TextEditingController docenteC = TextEditingController();
  final TextEditingController edificioC = TextEditingController();
  final TextEditingController horarioC = TextEditingController();
  final TextEditingController materiaC = TextEditingController();
  final TextEditingController salonC = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final Map arguments = ModalRoute.of(context)!.settings.arguments as Map? ?? {};
    if(arguments.isNotEmpty){
      docenteC.text = arguments['docente'];
      edificioC.text = arguments['edificio'];
      horarioC.text = arguments['horario'];
      materiaC.text = arguments['materia'];
      salonC.text = arguments['salon'];

    }
    return Scaffold(
      appBar: AppBar(title: const Text("Actualizar asignación"),),
      body: ListView(
        padding: EdgeInsets.all(60),
        children: [
          TextField(decoration: InputDecoration(labelText: "Docente"),
            controller: docenteC,autofocus: true,),
          SizedBox(height: 30,),
          TextField(decoration: InputDecoration(labelText: "Edificio"),
            controller: edificioC,),
          SizedBox(height: 30,),
          TextField(decoration: InputDecoration(labelText: "Horario"),
            controller: horarioC,),
          SizedBox(height: 30,),
          TextField(decoration: InputDecoration(labelText: "Materia"),
            controller: materiaC,),
          SizedBox(height: 30,),
          TextField(decoration: InputDecoration(labelText: "Salon"),
            controller: salonC,),
          SizedBox(height: 30,),
          FilledButton(onPressed: ()async{
            await updateAsignacion(
                arguments['uid'],
                docenteC.text,
                edificioC.text,
                horarioC.text,
                materiaC.text,
                salonC.text
            ).then((_){
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("¡Se actualizó con exito!")));
                Navigator.pop(context);
            });
          }, child: Text("Guardar"))
        ],
      ),
    );
  }
}
