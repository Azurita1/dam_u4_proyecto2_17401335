import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore db = FirebaseFirestore.instance;

Future<List>getAsignacion() async {
  List asignacion = [];
  // Referencia a la colección de la base de datos
  QuerySnapshot queryAsignacion = await db.collection('asignacion').get();
  for(var doc in queryAsignacion.docs){
    final Map<String,dynamic> data = doc.data() as Map<String,dynamic>;
    final asi = {
      "uid":doc.id,
      "docente":data['docente'],
      "edificio":data['edificio'],
      "horario":data['horario'],
      "materia":data['materia'],
      "salon":data['salon']
    };
    asignacion.add(asi);
  }
  return asignacion;
}

Future<void>addAsignacion(String d,e,h,m,s)async{
  await db.collection('asignacion').add({
    "docente":d,
    "edificio":e,
    "horario":h,
    "materia":m,
    "salon":s
  });
}

// Actualizar
Future <void> updateAsignacion(String uid, d,e,h,m,s)async{
  await db.collection('asignacion').doc(uid).set({
    "docente":d,
    "edificio":e,
    "horario":h,
    "materia":m,
    "salon":s
  });
}

// Eliminar
Future<void>deleteAsignacion(String uid)async{
  await db.collection('asignacion').doc(uid).delete();
}

// Insertar asistencia
Future<void> insertarAsistencia(String asignacionId, Map<String, dynamic> asistenciaData) async{
  await db.collection('asignacion').doc(asignacionId).collection('asistencia').add(asistenciaData);
}

Future<List>getAsistencia(String asignacionId) async {
  List asistencia = [];
  // Referencia a la colección de la base de datos
  QuerySnapshot queryAsistencia = await db.collection('asignacion').doc(asignacionId).collection('asistencia').get();
  for(var doc in queryAsistencia.docs){
    final Map<String,dynamic> data = doc.data() as Map<String,dynamic>;
    final asistenciaDoc = {
      "uid":doc.id,
      "fecha/hora":data['fecha/hora'],
      "revisor":data['revisor']
    };
    asistencia.add(asistenciaDoc);
  }
  return asistencia;
}


// Consulta 1: consultar asistencia por docente

Future<List<Map<String, dynamic>>> getConsulta1(String docente) async {
  List<Map<String, dynamic>> asistencias = [];
  QuerySnapshot querySnapshot = await db
      .collection('asignacion')
      .where('docente', isEqualTo: docente)
      .get();
  for (var doc in querySnapshot.docs) {
    QuerySnapshot asistenciasSnapshot = await doc.reference
        .collection('asistencia')
        .get();
    asistencias.addAll(asistenciasSnapshot.docs.map((doc) => doc.data() as Map<String, dynamic>).toList());
  }
  return asistencias;
}
// Consulta 2
/*Future<List<Map<String, dynamic>>> getConsulta2(String dato1, String dato2) async {
  List<Map<String, dynamic>> asistencias = [];
  QuerySnapshot asignacionesSnapshot = await db.collection('asignacion').get();
  for (var asignacionDoc in asignacionesSnapshot.docs) {
    QuerySnapshot asistenciasSnapshot = await asignacionDoc.reference
        .collection('asignacion')
        .where('horario', isGreaterThanOrEqualTo: dato1, isLessThan: dato2)
        .get();
    asistencias.addAll(asistenciasSnapshot.docs.map((asistenciaDoc) => asistenciaDoc.data() as Map<String, dynamic>).toList());
  }
  return asistencias;
}*/

Future<List<Map<String, dynamic>>> getConsulta2(String dato1, String dato2) async {
  List<Map<String,dynamic>> asistencias = [];
  QuerySnapshot asignacionesSnapshot = await db
      .collection('asignacion')
      .get();
  for (var doc in asignacionesSnapshot.docs) {
    QuerySnapshot asistenciasSnapshot = await doc.reference
        .collection('asignacion')
        .where('prueba', isGreaterThanOrEqualTo: dato1).where('prueba',isLessThan: dato2,)
        .get();
    asistencias.addAll(asistenciasSnapshot.docs.map((doc) => doc.data() as Map<String,dynamic>).toList());
  }
  return asistencias;
}

Future<List> getAsistenciasxFD(String dato1, String dato2) async {
  List asistencias = [];
  CollectionReference collectionReferenceAsistencias = db.collection('asignacion');
  QuerySnapshot queryAsistencia = await collectionReferenceAsistencias
      .where('prueba',isGreaterThanOrEqualTo: dato1)
      .where('prueba',isLessThanOrEqualTo: dato2)
      .get();
  for(var doc in queryAsistencia.docs) {
    final Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    final asistencia = {
      "docente": doc.id,
      "fecha": data['fecha'],
      "revisor": data['revisor'],
    };
    asistencias.add(asistencia);
  }
  await Future.delayed(const Duration(seconds: 1));

  return asistencias;
}

// Consulta 4: consultar asistencia por revisor
Future<List<Map<String, dynamic>>> getConsulta4(String revisor) async {
  List<Map<String, dynamic>> asistencias = [];
  QuerySnapshot querySnapshot = await db
      .collection('asignacion')

      .get();
  for (var doc in querySnapshot.docs) {
    QuerySnapshot asistenciasSnapshot = await doc.reference
        .collection('asistencia')
        .where('revisor', isEqualTo: revisor)
        .get();
    asistencias.addAll(asistenciasSnapshot.docs.map((doc) => doc.data() as Map<String, dynamic>).toList());
  }
  return asistencias;
}