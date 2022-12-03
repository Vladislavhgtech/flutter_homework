import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_project/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../services/validate_email.dart';

class RegistrationView extends StatefulWidget{
  static const routName = '/registration';
  RegistrationView({Key key}): super(key: key);

  @override
  _RegistrationViewState createState() => _RegistrationViewState();
}

class _RegistrationViewState extends State<RegistrationView>{
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _controllerEmail = TextEditingController();
  TextEditingController _controllerPassword = TextEditingController();
  AuthService _authService = AuthService();
  User _user;

  void _registration() async{
    if (_formKey.currentState.validate()){
      _formKey.currentState.save();
      _user = await _authService.signUp(_controllerEmail.text, _controllerPassword.text);
      print(_user);
      _formKey.currentState.reset();
      if (_user.email != null) Navigator.of(context).pushNamed("/profile");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text('Регистрация'),
      ),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                key: Key('fieldEmail'),
                controller: _controllerEmail,
                validator: (value) {
                  if (value == '') return 'Введите email';
                  if (!validateEmail(value))
                    return 'Поле email заполнено не корректно';
                  return null;
                },
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(labelText: 'Email', prefixIcon: Icon(Icons.mail)),
              ),
              TextFormField(
                key: Key('fieldPassword'),
                controller: _controllerPassword,
                validator: (value) {
                  if (value == '') {
                    return 'Введите пароль';
                  } else if(value.length < 6){
                    return 'Введите 6 или более цифр';
                  }

                  return null;
                },
                decoration: InputDecoration(labelText: 'Password', prefixIcon: Icon(Icons.lock), helperText: 'Введите пароль не менее 6 символов'),
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  WhitelistingTextInputFormatter.digitsOnly
                ],
              ),
              RaisedButton(
                  child: Text('Зарегестрироваться'),
                  onPressed: () {
                    _registration();
                  }
              ),
              // Text(_isInt == 1 ? 'Нет такого пользователя' : '')
              FlatButton(
                key: Key('fieldFlatButton'),
                child: RichText(
                  text: TextSpan(children: [
                    TextSpan(text: 'Авторизация'
                    )
                  ], style: Theme.of(context).textTheme.bodyText1),
                ),
                onPressed: (){Navigator.of(context).pushNamed("/");},
              ),
            ],
          ),
        ),
      ),
    );
  }
}