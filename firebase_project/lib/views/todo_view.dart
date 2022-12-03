import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_project/services/auth_service.dart';
import 'package:flutter/material.dart';

class ToDoView extends StatefulWidget{
  static const routName = '/todo';
  ToDoView({Key key}): super(key: key);

  @override
  _ToDoViewState createState() => _ToDoViewState();
}

class _ToDoViewState extends State<ToDoView>{
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _controllerName = TextEditingController();
  TextEditingController _controllerMessage = TextEditingController();
  final dbMessage = FirebaseFirestore.instance;
  List mesagesList;
  AuthService _authService = AuthService();
  User _user;

  _saveToDo()async{
    DocumentReference ref = await dbMessage.collection('message').add(
      {
        'title': _controllerName.text,
        'message': _controllerMessage.text,
        'isDone': false,
      }
    );
    print(ref.id);
  }


  _updateIsDone(QueryDocumentSnapshot<Object> message) async{
    Map<String, dynamic> data  = {
      'isDone': !message['isDone']
    };
    message.reference.update(data);
  }

  _updateToDo(QueryDocumentSnapshot<Object> message, Map<String, Object> data) async{//
    message.reference.update(data);
  }

  _deleteTodo(QueryDocumentSnapshot<Object> message) async{
    message.reference.delete();
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text ('ToDo'),
      ),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Center(
          child: Column(
            children: <Widget>[
              SizedBox(height: 20),
              TextFormField(
                key: Key('fieldName'),
                controller: _controllerName,
                validator: (value) {
                  if (value == '') return 'Введите назвыание';
                  return null;
                },
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  helperText: 'Заголовок сообщения',
                  hintText: 'Введите название',
                  labelText: 'Name',
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 2.0),
                    borderRadius: BorderRadius.circular(10)
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide( width: 2.0),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                key: Key('fieldMessage'),
                controller: _controllerMessage ,
                validator: (value) {
                  if (value == '') return 'Введите сообщение';
                  return null;
                },
                minLines: 3,
                maxLines: 5,
                decoration: InputDecoration(
                  helperText: 'Текст сообщения',
                  hintText: 'Введите сообщение',
                  labelText: 'Message',
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 2.0),
                      borderRadius: BorderRadius.circular(10)
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 2.0),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              RaisedButton(
                  child: Text('Отправить'),
                  onPressed: () {
                    if(_formKey.currentState.validate()){
                    _formKey.currentState.save();
                    _saveToDo();
                    _formKey.currentState.reset();
                    }
                  }
              ),
              SizedBox(height: 20),
              Expanded(
                  child:  StreamBuilder<QuerySnapshot>(
                      stream: FirebaseFirestore.instance.collection('message').orderBy('title').snapshots(),
                      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot>snapshot){
                        if(snapshot.connectionState == ConnectionState.waiting)
                          return Center(child: CircularProgressIndicator(),);
                        // print('snapshot -  ${snapshot.data.docs}');
                        return ListView(
                               children: snapshot.data.docs.map((message){
                                  return Dismissible(
                                    background: Container(
                                      color: Colors.red,
                                      child: Padding(
                                        padding: const EdgeInsets.all(15),
                                        child: Row(
                                          children: [
                                            Icon(Icons.delete, color: Colors.white),
                                          ],
                                        ),
                                      ),
                                    ),
                                    secondaryBackground: Container(
                                      color: Colors.red,
                                      child: Padding(
                                        padding: const EdgeInsets.all(15),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          children: [
                                            Icon(Icons.delete, color: Colors.white),
                                          ],
                                        ),
                                      ),
                                    ),
                                    onDismissed: (DismissDirection direction){
                                      _deleteTodo(message);
                                    },
                                    key: ValueKey<String>(message.id),
                                    child: ListTile(
                                      leading: CircleAvatar(radius: 10.0, backgroundColor: message['isDone'] != true? Colors.red : Colors.green,),
                                    trailing:
                                          IconButton( icon: Icon(Icons.edit),
                                            onPressed: (){
                                              Navigator.of(context).pushNamed("/updatetodo", arguments: {'message': message});
                                            },
                                          ),
                                    subtitle: Text('${message['message']}'),
                                    title: Text(message['title']),
                                    onTap: (){
                                      _updateIsDone(message);
                                    },
                                  ),
                                  );
                              }).toList(),
                        );
                      }
                  )
              ),

            ],
              ),
          ),
        ),
      ),
    );
  }
}