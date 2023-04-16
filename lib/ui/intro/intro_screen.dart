import 'package:flutter/material.dart';
import 'package:odas_trl_framework/routes.dart';

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
                Navigator.of(context).pushNamed(Routes.home);
              },
              icon: Icon(Icons.developer_board),
              label: Text('Development and TRL Measurement Module'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton.icon(
              onPressed: () {
                // Navigate to Controle, Monitoramento e Testes module
              },
              icon: Icon(Icons.control_camera),
              label: Text('Control, Monitoring, and Testing Module'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton.icon(
              onPressed: () {
                // Navigate to Análise de Dados module
              },
              icon: Icon(Icons.analytics),
              label: Text('Data Analysis and Processing Module'),
            ),
          ],
        ),
      ),
    );
  }
}
