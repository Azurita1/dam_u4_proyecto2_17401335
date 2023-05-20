import 'package:dam_u4_proyecto2_17401335/Asignacion.dart';
import 'package:dam_u4_proyecto2_17401335/pages/Consulta1.dart';
import 'package:dam_u4_proyecto2_17401335/pages/Consulta2.dart';
import 'package:dam_u4_proyecto2_17401335/pages/Consulta4.dart';
import 'package:dam_u4_proyecto2_17401335/pages/Menu.dart';
import 'package:dam_u4_proyecto2_17401335/pages/actualizarA.dart';
import 'package:dam_u4_proyecto2_17401335/pages/insertarA.dart';
import 'package:dam_u4_proyecto2_17401335/pages/insertarAsistencia.dart';
import 'package:dam_u4_proyecto2_17401335/pages/pruebaConsulta2.dart';
import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),debugShowCheckedModeBanner: false,
      //home: Asignacion()
      initialRoute: '/',
      routes: {
        '/':(context)=>Aplicacion5(),
        '/insertarAsignacion':(context)=>InsertarAsignacion(),
        '/actualizarAsignacion':(context)=>ActualizarAsig(),
        '/consulta1':(context)=>Consulta1(),
        '/consulta2':(context)=>Consulta2(),
        '/consulta22':(context)=>Cosnulta2P(),
        '/consulta4':(context)=>Consulta4(),
      },
    );
  }
}