import 'package:flutter/material.dart';

class IntroScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Select a module:',
              style: TextStyle(fontSize: 24.0),
            ),
            SizedBox(height: 32.0),
            ElevatedButton.icon(
              onPressed: () {
                // Navigate to Desenvolvimento classificado module
              },
              icon: Icon(Icons.class_outlined),
              label: Text('Desenvolvimento classificado'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton.icon(
              onPressed: () {
                // Navigate to Controle, Monitoramento e Testes module
              },
              icon: Icon(Icons.control_camera),
              label: Text('Controle, Monitoramento e Testes'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton.icon(
              onPressed: () {
                // Navigate to Análise de Dados module
              },
              icon: Icon(Icons.analytics),
              label: Text('Análise de Dados'),
            ),
          ],
        ),
      ),
    );
  }
}
