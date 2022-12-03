import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_project/services/auth_service.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfileView extends StatefulWidget{
  static const routName = '/profile';
  ProfileView({Key key}): super(key: key);

  @override
  _ProfileViewState createState() => _ProfileViewState();
}
class _ProfileViewState extends State<ProfileView>{
  AuthService _authService = AuthService();
  User _user;
  File _image;

  // @override
  // void initState() {
  //   getUser();
  // }

  // void getUser() async{
  //   _user = await _authService.getCurrentUser();
  //   if (_user == null && _user.email == null)Navigator.of(context).pushNamed("/");
  // }


  Future<void> _saveImage() async{
    _user = await _authService.getCurrentUser();
    final _referense = await FirebaseStorage.instance.ref('user/${_user.uid}/avatar.jpg');
    print('_referense - ${_referense.fullPath}');
    await _referense.putFile(_image);
    print('test test test test');
    String photoUrl = await _referense.getDownloadURL();
    print('test test test test');
    print('photoUrl - ${photoUrl}');
    _authService.updateUserPhoto(photoUrl);
    _user = await _authService.getCurrentUser();
    print('photoUrl2 - ${_user.photoURL}');
  }

  void _signOut() async{
    _authService.signOut();
    _user = null;
    Navigator.of(context).pushNamed("/");
  }

  Future getImage() async{
    XFile _imagePic = await ImagePicker().pickImage(source: ImageSource.gallery);
    if(_imagePic != null){
      setState(() {
        _image = File(_imagePic.path);
      });
    }
    _saveImage();
  }

  void sendEmailVerification()async{
    _user = await _authService.getCurrentUser();
    if (_user != null && _user.email != null && !_user.emailVerified){
      await _authService.emailVerification();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text ('Профиль'),
        actions: [
          Builder(
            builder: (context) => IconButton(
              icon: Icon(Icons.exit_to_app),
              onPressed: () {
                _signOut();
              },
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: <Widget>[
              SizedBox(height: 20),
              FutureBuilder(
                future: _authService.getCurrentUser(),
                builder: (BuildContext context, AsyncSnapshot snapshot){
                  switch (snapshot.connectionState){
                    case ConnectionState.waiting:
                      return CircleAvatar(
                            radius: 80.0,
                            backgroundImage: AssetImage('assets/images/person.jpg'),
                          );
                      break;
                    case ConnectionState.none:
                      return Center(child: Text('Ошибка соединения'));
                      break;
                    case ConnectionState.done:
                      if(snapshot.data != null) {
                        _user = snapshot.data;
                        // print('user3 - $_user');
                        return  Column(
                          children: <Widget>[
                            CircleAvatar(
                            radius: 80.0,
                            backgroundImage: _user == null ? AssetImage('assets/images/person.jpg')
                                : _user.photoURL == null ? AssetImage('assets/images/person.jpg')
                                : NetworkImage(_user.photoURL),
                            ),
                            SizedBox(height: 20),
                            Text('Email: ${_user.email}'),
                            SizedBox(height: 20),
                            _user.emailVerified == true ? SizedBox(height: 0):
                            ElevatedButton(
                                child: Text('Подтвердить Email'),
                                onPressed: (){
                                  sendEmailVerification();
                                }),
                          ]
                        );
                        } else _signOut();
                  }
                }
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pushNamed("/todo");
                },
                child: const Text('To Do'),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: getImage,
        tooltip: 'Pic Image',
        child: const Icon(Icons.add_a_photo_outlined),
        backgroundColor: Colors.blue,
      ),
    );
  }
}
