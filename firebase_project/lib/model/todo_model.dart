import 'package:cloud_firestore/cloud_firestore.dart';

class ToDoModel{

  final toDo = FirebaseFirestore.instance;


  Future addData(String collection,Map<String, dynamic> data) async{
    void ref = await toDo.collection(collection).add(data);
  }

  Future updateData(String collection,Map<String, dynamic> data) async{

  }

  Future deleteData() async{

  }

}