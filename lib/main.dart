import 'package:flutter/material.dart';

void main() {
  runApp(MyCalculator());
}

class MyCalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora de IMC',
      theme: ThemeData(
        primaryColor: Colors.blue,
        fontFamily: 'Roboto',
        textTheme: TextTheme(
          headline6: TextStyle(
            color: Colors.black87,
            fontSize: 22.0,
            fontWeight: FontWeight.bold,
          ),
          bodyText2: TextStyle(
            color: Colors.black87,
            fontSize: 18.0,
          ),
        ),
      ),
      home: Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  // Variáveis para armazenar os valores dos operandos
  double _peso = 0;
  double _altura = 0;

  // Variável para armazenar o resultado das operações
  double _imc = 0;

  // Função para calcular o IMC
  void _calcularIMC() {
    setState(() {
      _imc = _peso / (_altura * _altura);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculadora de IMC'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            // Campo de entrada para o peso
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Digite seu peso (kg):',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {
                  _peso = double.tryParse(value) ?? 0;
                });
              },
            ),
            SizedBox(height: 20.0),
            // Campo de entrada para a altura
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Digite sua altura (m):',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {
                  _altura = double.tryParse(value) ?? 0;
                });
              },
            ),
            SizedBox(height: 20.0),
            // Botão para calcular o IMC
            ElevatedButton(
              onPressed: () {
                if (_peso > 0 && _altura > 0) {
                  _calcularIMC();
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Por favor, insira valores válidos.'),
                    ),
                  );
                }
              },
              child: Text('Calcular IMC'),
            ),
            SizedBox(height: 20.0),
            // Exibição do resultado do IMC
            Text(
              'Seu IMC: ${_imc.toStringAsFixed(2)}',
              style: Theme.of(context).textTheme.headline6,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
