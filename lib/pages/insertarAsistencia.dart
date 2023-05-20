import 'package:dam_u4_proyecto2_17401335/services/firebase_services.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class InsertarAsistencia extends StatefulWidget {
  final asignacionId;
  const InsertarAsistencia({Key? key,required this.asignacionId}) : super(key: key);

  @override
  State<InsertarAsistencia> createState() => _InsertarAsistenciaState();
}

class _InsertarAsistenciaState extends State<InsertarAsistencia> {
  DateTime fechaC = DateTime.now();
  DateTime horaC = DateTime.now();
  String fechaHora = '';
  TextEditingController revisorC = TextEditingController();
  @override
  Widget build(BuildContext context) {
    setState(() {
      fechaHora =
      'Fecha: ${fechaC.day.toString() +' de '+ fechaC.month.toString() +' del '+ fechaC.year.toString()} '
          'a las : ${horaC.hour.toString() +':'+ horaC.minute.toString()}';
    });
    return Scaffold(
      appBar: AppBar(title: const Text("Registrar asistencia"),),
      body: ListView(
        padding: EdgeInsets.all(60),
        children: [
          TextButton(onPressed: () async {
            final DateTime? picked = await showDatePicker(
              context: context, initialDate: fechaC,
              firstDate: DateTime(2023,1), lastDate: DateTime(2222),
            );
            final TimeOfDay? picked2 = await showTimePicker(
              context: context, initialTime: TimeOfDay.fromDateTime(horaC),
            );
            if (picked != null && picked != fechaC &&
                picked2 != null && picked2 != horaC) {
              setState(() {
                fechaC = picked;
                horaC = DateTime(fechaC.year,fechaC.month,fechaC.day,picked2!.hour,picked2.minute);
                fechaHora =
                'Fecha: ${fechaC.day.toString() +'del '+ fechaC.month.toString() +'del '+ fechaC.year.toString()} ';
                'Hora: ${horaC.hour.toString() +':'+ horaC.minute.toString()}';
              });
            }
          }, child: Text('Fecha/hora:${DateFormat.yMd().format(fechaC)}'),),
          SizedBox(height: 30,),
          TextField(decoration: InputDecoration(labelText: "Revisor"),
          controller: revisorC,),
          SizedBox(height: 30,),
          FilledButton(onPressed: ()async{
            await insertarAsistencia(widget.asignacionId ?? '', {
              "fecha/hora": fechaHora,
              "revisor":revisorC.text
            }).then((_){
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Se registro la asistencia con exito")));
              Navigator.pop(context);
            });
          }, child: const Text("Insertar asistencia"))
        ],
      ),
    );
  }
}
