import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'cep.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ViaCEP App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController cepController = TextEditingController();
  Cep? cepData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ViaCEP App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: cepController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'Digite o CEP',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                final cep = cepController.text.trim();
                final response = await http.get(Uri.parse('https://viacep.com.br/ws/$cep/json/'));

                if (response.statusCode == 200) {
                  final data = json.decode(response.body);
                  setState(() {
                    cepData = Cep(
                      cep: data['cep'],
                      logradouro: data['logradouro'],
                      complemento: data['complemento'],
                      bairro: data['bairro'],
                      localidade: data['localidade'],
                      uf: data['uf'],
                    );
                  });
                  Cep.addCep(cepData!);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('CEP não encontrado'),
                    ),
                  );
                }
              },
              child: Text('Buscar'),
            ),
            SizedBox(height: 20),
            if (cepData != null) ...[
              Text('CEP: ${cepData!.cep}'),
              Text('Logradouro: ${cepData!.logradouro}'),
              Text('Complemento: ${cepData!.complemento}'),
              Text('Bairro: ${cepData!.bairro}'),
              Text('Localidade: ${cepData!.localidade}'),
              Text('UF: ${cepData!.uf}'),
            ],
          ],
        ),
      ),
    );
  }
}
