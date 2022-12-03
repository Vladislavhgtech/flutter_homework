import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_project/services/auth_service.dart';
import 'package:firebase_project/services/validate_email.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AuthorizationView extends StatefulWidget{
  static const routName = '/';
  AuthorizationView({Key key}): super(key: key);

  @override
  _AuthorizationViewState createState() => _AuthorizationViewState();
}

class _AuthorizationViewState extends State<AuthorizationView>{

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _controllerEmail = TextEditingController();
  TextEditingController _controllerPassword = TextEditingController();
  AuthService _authService = AuthService();
  User _user;


  @override
  void initState() {
    getUser();
  }

  void getUser() async{
    _user = await _authService.getCurrentUser();
    if (_user != null && _user.email != null)Navigator.of(context).pushNamed("/profile");
  }

  void _singIn() async{
    _user = await _authService.signIn(_controllerEmail.text, _controllerPassword.text);
    if (_user.email != null) Navigator.of(context).pushNamed("/profile");
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text('Авторизация'),
      ),
      body:
      SafeArea(
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
                  if (value == '') return 'Введите пароль';
                  return null;
                },
                decoration: InputDecoration(labelText: 'Password', prefixIcon: Icon(Icons.lock)),
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  WhitelistingTextInputFormatter.digitsOnly
                ],
              ),
              RaisedButton(
                  child: Text('Войти'),
                  onPressed: () {
                    _singIn();
                  }
              ),
              // Text(_isInt == 1 ? 'Нет такого пользователя' : '')
              FlatButton(
                key: Key('fieldFlatButton'),
                child: RichText(
                  text: TextSpan(children: [
                    TextSpan(text: 'Регистрация'
                    )
                  ], style: Theme.of(context).textTheme.bodyText1),
                ),
                onPressed: (){Navigator.of(context).pushNamed("/registration");},
              ),
            ],
          ),
        ),
      ),
    );
  }
}