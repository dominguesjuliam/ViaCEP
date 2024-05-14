import 'package:flutter/material.dart';
import 'package:via_cep_app/cep.dart';

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
              onPressed: () {
                // Implementar a lógica para buscar o CEP aqui
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
