import 'dart:io';
import 'package:mongo_dart/mongo_dart.dart';
import 'dart:convert';
main(List<String>arguments) async{
  int port =8085;
  var server= await HttpServer.bind('localhost', port);
  Db db=Db('mongodb://localhost:27017/test');
 
await db.open();
 print('Connected to the Database');

 DbCollection coll=db.collection('people');

server.listen((HttpRequest request) async{
   
   switch(request.uri.path){
    case '/':
      request.response.write('Hello World people');
      await request.response.close();
      break;
    case '/people':
    //GET
    if(request.method=="GET"){
     request.response.write(await coll.find().toList());
     await request.response.close();
    }
    //POST
    if(request.method=="POST"){
     //request.response.write('Post Request');
     var content =await utf8.decoder.bind(request);
     //var data=json.decode(content);
     //await coll.save(content);
     await request.response.close();
    }
    //PATCH
    if(request.method=="PATCH"){
     
     await request.response.close();
    }
    //DELETE
    if(request.method=="DELETE"){
     request.response.write('Delete Request');
     await request.response.close();
    }
    //PUT 
    if(request.method=="PUT"){
     request.response.write('Put Request');
     await request.response.close();
    }
      break;
    default:
     request.response.statusCode=HttpStatus.notFound;
     request.response.write('NOT FOUND !!');
     await request.response.close();
   }
 });
 
 print('Server listening at http://localhost:$port');
 
}