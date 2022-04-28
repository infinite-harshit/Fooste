import 'package:demo/homescreen.dart';
import 'package:demo/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(home:Home()));
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title:Text('MyApp'),
      ),
      body:Center(
          child:Text("Hello World"),
      ),
      drawer:Drawer(),
    );
  }
}

