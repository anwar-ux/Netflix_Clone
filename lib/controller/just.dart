import 'dart:convert';
import 'package:http/http.dart' as http;

just() async {
  Map<String, dynamic> Json = {
    'name': 'anwar',
    'age': 21,
  };

  final  response =await http.post(Uri.parse(""),
  
  body: jsonEncode(json),
  );

  if(response.statusCode==200){
    
  }
}
