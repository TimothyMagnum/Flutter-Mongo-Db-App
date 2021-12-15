//import 'package:http/http.dart';
import 'dart:io';
import 'package:flutter/widgets.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mongo_dart/mongo_dart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:core';
void main() {
  runApp(GeeksForGeeks());
}
 
class GeeksForGeeks extends StatelessWidget{
  //const GeeksForGeeks({Key? key}) : super(key: key);
  String getValue='';
  Future<void>uploadFile() async{
        const port =8085;
        var server= await HttpServer.bind('localhost', port);
        Db db=Db('mongodb://localhost:27017/test');
        await db.open();
        print('Connected to the Database');
        DbCollection coll=db.collection('names');
        
        // ignore: deprecated_member_use
        await coll.save({"textFieldKey": getValue});
        await server.close();
  }
  Widget build(BuildContext context){
     
    // Material App
    return MaterialApp(
       
      // Scaffold Widget
      home: Scaffold(
        appBar:  AppBar(
          title: Text('Flutter MongoDB Dummy App'),
        ),
        body: Column(children: [
            TextField(
           cursorColor: Colors.red,
           cursorWidth: 12.0,
           cursorRadius: Radius.circular(12.0),
           style: TextStyle(color: Colors.green),
           onChanged: (text) {
           getValue = text;
          },
           decoration: InputDecoration(labelText: 'Submit Text')
         ),
         TextButton(onPressed: uploadFile, child: Text('Submit'))
        ],)
        ),
      );
  }
  
}

