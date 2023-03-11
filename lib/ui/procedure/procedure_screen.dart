import 'package:flutter/material.dart';
import 'package:odas_trl_framework/models/trls/trl_model.dart';
import 'package:odas_trl_framework/providers/trl/trl_provider.dart';
import 'package:odas_trl_framework/routes.dart';
import 'package:provider/provider.dart';
//import 'package:pdf_render/pdf_render_widgets.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:syncfusion_flutter_core/theme.dart';

import '../../constants/constants.dart';
//import 'package:pdf_render/pdf_render.dart';

class ProcedureScreen extends StatelessWidget {
  const ProcedureScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var trlRef = context.read<TrlProvider>();
    return Scaffold(
      appBar: AppBar(
        title: Text(
            'TRL ${trlRef.trl} ${trlRef.isHardwareSelected ? '(H) - ${TrlModel.hardSecIssues[trlRef.trl - 1][trlRef.question - 1]}' : '(S) - ${TrlModel.softSecIssues[trlRef.trl - 1][trlRef.question - 1]}'}'),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.zoom_in,
              color: Colors.white,
            ),
            onPressed: () {
              //_pdfViewerController.zoomLevel = 2;
            },
          ),
        ],
      ),
      body: SfPdfViewerTheme(
          data: SfPdfViewerThemeData(
            brightness: Brightness.dark,
            backgroundColor: const Color.fromARGB(255, 61, 61, 61),
          ),
          child: SfPdfViewer.asset(
            trlRef.getPDFAssetPath(),
            onDocumentLoadFailed: (PdfDocumentLoadFailedDetails details) {
              showErrorDialog(context, details.error, details.description);
            },
          )),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: 0,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "HOME"),
            BottomNavigationBarItem(
              icon: Icon(Icons.backspace_rounded),
              label: "VOLTAR",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "HOME",
            ),
          ],
          onTap: (int index) {
            switch (index) {
              case 0:
                Navigator.of(context).pushNamed(Routes.overview);
                break;
              case 1:
                Navigator.pop(context);
                break;
              case 2:
                Navigator.of(context).pushNamed(Routes.overview);
                break;
            }
          }),
    );
  }

  void showErrorDialog(BuildContext context, String error, String description) {
    showDialog<dynamic>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Erro"),
            content: Text(
                "Ainda não há procedimentos implementados para esta tarefa."),
            actions: <Widget>[
              TextButton(
                child: const Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.pop(context);
                },
              ),
            ],
          );
        });
  }
}
