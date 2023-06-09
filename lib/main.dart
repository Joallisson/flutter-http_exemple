import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  Future<void> callBackend() async{

    Map<String, String> headers = {
      "content-type": "application/json"
    };

    Map<String, dynamic> body = {
      'title': 'Teste 123',
      'body': 'Conteúdo teste',
      'userId': 11,
    };

    final dio = Dio();

    try {

      Response response = await dio.post(
        'https://jsonplaceholder.typicode.com/posts',
        options: Options(
          headers: headers,
        ),
        data: body,
      );

      print(response.data);
      
    } 
    on DioException catch (e) {

      print('Error na request: ${e.response?.statusCode}');

      //print('Error genérico: $e');
    }
  
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    callBackend();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Teste HTTP'),
      ),
      body: const Center(
        child: Text(
          'Realizando teste HTTP',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20
          ),
        ),
      ),
    );
  }
}