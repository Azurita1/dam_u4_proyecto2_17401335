import 'package:dam_u4_proyecto2_17401335/services/firebase_services.dart';
import 'package:flutter/material.dart';

class InsertarAsignacion extends StatefulWidget {
  const InsertarAsignacion({Key? key}) : super(key: key);

  @override
  State<InsertarAsignacion> createState() => _InsertarAsignacionState();
}

class _InsertarAsignacionState extends State<InsertarAsignacion> {
  final TextEditingController docenteC = TextEditingController();
  final TextEditingController edificioC = TextEditingController();
  final TextEditingController horarioC = TextEditingController();
  final TextEditingController materiaC = TextEditingController();
  final TextEditingController salonC = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Insertar asignación"),),
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
            await addAsignacion(
                docenteC.text,
                edificioC.text,
                horarioC.text,
                materiaC.text,
                salonC.text
            );
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Se inserto con exito")));
            Navigator.pop(context);
          }, child: Text("Guardar"))
        ],
      ),
    );
  }
}
