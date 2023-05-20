import 'package:flutter/material.dart';
import 'package:flutter_math_fork/flutter_math.dart';
import 'package:provider/provider.dart';

class MeuModelo with ChangeNotifier {
  String _valor = 'Valor inicial';

  String get valor => _valor;

  void atualizarValor(String novoValor) {
    _valor = novoValor;
    notifyListeners();
  }
}

class MyDialog extends StatelessWidget {
  final TextEditingController _editedTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final modelo = Provider.of<MeuModelo>(context, listen: false);
    _editedTextController.text = modelo.valor;

    return AlertDialog(
      title: Text('Equação'),
      content: Container(
        constraints: BoxConstraints(maxWidth: 800),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextField(
                  controller: _editedTextController,
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Input TeX equation here',
                  ),
                  onChanged: (value) {
                    modelo.atualizarValor(value);
                  }),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Center(
                    child: Text(
                      "Flutter Math's output",
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(width: 1),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    alignment: Alignment.topCenter,
                    padding: EdgeInsets.all(10),
                    child: Consumer<MeuModelo>(
                      builder: (context, modelo, _) {
                        //_textEditingController.text = modelo.valor;
                        return SelectableMath.tex(
                          _editedTextController.text,
                          textStyle: TextStyle(fontSize: 22),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            //final novoValor = _textEditingController.text;
            //modelo.atualizarValor(novoValor);
            Navigator.of(context).pop();
          },
          child: Text('Salvar'),
        ),
      ],
    );
  }
}

class Cards extends StatelessWidget {
  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: [
        ElevatedButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (_) => ChangeNotifierProvider.value(
                value: Provider.of<MeuModelo>(context, listen: false),
                child: MyDialog(),
              ),
            );
          },
          child: Text('Abrir Dialog'),
        ),
        /*
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Equation Dialog'),
                      content: Container(
                        constraints: BoxConstraints(maxWidth: 800),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: TextField(
                                controller: _textEditingController,
                                keyboardType: TextInputType.multiline,
                                maxLines: null,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Input TeX equation here',
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: <Widget>[
                                  Center(
                                    child: Text(
                                      "Flutter Math's output",
                                      style:
                                          Theme.of(context).textTheme.headline6,
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(width: 1),
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                    alignment: Alignment.topCenter,
                                    padding: EdgeInsets.all(10),
                                    child: SelectableMath.tex(
                                      _textEditingController.text,
                                      textStyle: TextStyle(fontSize: 22),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      actions: <Widget>[
                        ElevatedButton(
                          child: Text('Close'),
                          onPressed: () {
                            final novoValor = _textEditingController.text;
                            modelo.atualizarValor(novoValor);
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
              },
              child: Text('Open Equation Dialog'),
            ),
            */
        SizedBox(height: 20),
        Consumer<MeuModelo>(
          builder: (context, modelo, _) {
            //_textEditingController.text = modelo.valor;
            return Text(
              'Equation Value: ${modelo.valor}',
              style: TextStyle(fontSize: 18),
            );
          },
        ),
      ],
    ));
  }
}
