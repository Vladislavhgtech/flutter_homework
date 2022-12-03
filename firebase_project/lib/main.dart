
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_project/views/authorization%20_view.dart';
import 'package:firebase_project/views/profile_view.dart';
import 'package:firebase_project/views/registration_view.dart';
import 'package:firebase_project/views/todo_view.dart';
import 'package:firebase_project/views/updateToDo_view.dart';
import 'package:flutter/material.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
    initialRoute: '/',
    onGenerateRoute: (RouteSettings settings){
        switch(settings.name){
          case AuthorizationView.routName:
            return MaterialPageRoute(builder: (BuildContext context){
              return AuthorizationView();
            });
          case RegistrationView.routName:
            return MaterialPageRoute(builder: (BuildContext context){
              return RegistrationView();
            });
          case ProfileView.routName:
            return MaterialPageRoute(builder: (BuildContext context){
              return ProfileView();
            });
          case ToDoView.routName:
            return MaterialPageRoute(builder: (BuildContext context){
              return ToDoView();
            });
          case UpdateToDoView.routName:
            final args = settings.arguments as Map<String, dynamic>;
            return MaterialPageRoute(builder: (BuildContext context){
              if(args != null && args.containsKey('message')){
                return UpdateToDoView(message: args['message']);
              }
              return UpdateToDoView();
            });
        }
    },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[],
        ),
      ),
    );
  }
}
