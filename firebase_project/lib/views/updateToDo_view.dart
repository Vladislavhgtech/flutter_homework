import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UpdateToDoView extends StatefulWidget{
  static const routName = '/updatetodo';
  UpdateToDoView({Key key, this.message}): super(key: key);

    final QueryDocumentSnapshot<Object> message;

  @override
  _UpdateToDoViewState createState() => _UpdateToDoViewState();
}

class _UpdateToDoViewState extends State<UpdateToDoView>{
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _controllerName = TextEditingController();
  TextEditingController _controllerMessage = TextEditingController();




  _updateToDo(QueryDocumentSnapshot<Object> message) async{
    Map<String, dynamic> data = {
      'title': _controllerName.text,
      'message': _controllerMessage.text,
      'isDone': message['isDone'],
    };
    message.reference.update(data);
  }

  @override
  Widget build(BuildContext context) {
    _controllerName.text = widget.message['title'];
    _controllerMessage.text = widget.message['message'];
    return Scaffold(
      appBar: AppBar(
        // automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text ('UpdateToDo'),
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
                        _updateToDo(widget.message);
                        _formKey.currentState.reset();
                        Navigator.of(context).pop();
                      }
                    }
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}