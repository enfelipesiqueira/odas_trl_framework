import 'package:flutter/material.dart';
import 'package:odas_trl_framework/constants/constants.dart';
import 'package:odas_trl_framework/models/trls/trl_model.dart';

class TrlProvider extends ChangeNotifier {
  bool isHardwareSelected = true;
  int trl = 1;
  int question = 1;

  List<bool> hardMainIssuesChecked = List.filled(9, false);
  List<bool> softMainIssuesChecked = List.filled(9, false);

  List<List<bool>> hardSecIssuesChecked = [];
  List<List<bool>> softSecIssuesChecked = [];

  TrlProvider() {
    // Mapeando questões secundárias para a variável bool de 'tarefa executada'
    for (var i = 0; i < 9; i++) {
      hardSecIssuesChecked.add([]);
      hardSecIssuesChecked[i] =
          TrlModel.hardSecIssues[i].map((e) => false).toList();
      softSecIssuesChecked.add([]);
      softSecIssuesChecked[i] =
          TrlModel.softSecIssues[i].map((e) => false).toList();

      // Incluindo marcadores nos títulos dos procedimentos
      for (var j = 0; j < TrlModel.hardSecIssues[i].length; j++) {
        TrlModel.hardSecIssues[i][j] =
            '${String.fromCharCode(Constants.codeA + j)} - ${TrlModel.hardSecIssues[i][j]}';
      }
      for (var j = 0; j < TrlModel.softSecIssues[i].length; j++) {
        TrlModel.softSecIssues[i][j] =
            '${String.fromCharCode(Constants.codeA + j)} - ${TrlModel.softSecIssues[i][j]}';
      }
    }
  }

  void mainIssueChange() {
    if (isHardwareSelected) {
      hardMainIssuesChecked[trl - 1] = !hardMainIssuesChecked[trl - 1];
      // Verificando se todas as tarefas foram concluídas
      if (hardMainIssuesChecked[trl - 1] == true) {
        hardSecIssuesChecked[trl - 1] =
            hardSecIssuesChecked[trl - 1].map((e) => true).toList();
      } else {
        hardSecIssuesChecked[trl - 1] =
            hardSecIssuesChecked[trl - 1].map((e) => false).toList();
      }
    } else {
      softMainIssuesChecked[trl - 1] = !softMainIssuesChecked[trl - 1];
      // Verificando se todas as tarefas foram concluídas
      if (softMainIssuesChecked[trl - 1] == true) {
        softSecIssuesChecked[trl - 1] =
            softSecIssuesChecked[trl - 1].map((e) => true).toList();
      } else {
        softSecIssuesChecked[trl - 1] =
            softSecIssuesChecked[trl - 1].map((e) => false).toList();
      }
    }
    notifyListeners();
  }

  void secIssueChange(int question) {
    if (isHardwareSelected) {
      hardSecIssuesChecked[trl - 1][question - 1] =
          !hardSecIssuesChecked[trl - 1][question - 1];

      // Verificando se todas as tarefas foram concluídas
      if (!hardSecIssuesChecked[trl - 1].contains(false)) {
        hardMainIssuesChecked[trl - 1] = true;
      } else {
        hardMainIssuesChecked[trl - 1] = false;
      }
    } else {
      softSecIssuesChecked[trl - 1][question - 1] =
          !softSecIssuesChecked[trl - 1][question - 1];

      // Verificando se todas as tarefas foram concluídas
      if (!softSecIssuesChecked[trl - 1].contains(false)) {
        softMainIssuesChecked[trl - 1] = true;
      } else {
        softMainIssuesChecked[trl - 1] = false;
      }
    }

    //

    notifyListeners();
  }

  bool getMainIssueChecked() {
    if (isHardwareSelected) {
      return hardMainIssuesChecked[trl - 1];
    } else {
      return softMainIssuesChecked[trl - 1];
    }
  }

  bool getSecIssueChecked(int question) {
    if (isHardwareSelected) {
      return hardSecIssuesChecked[trl - 1][question - 1];
    } else {
      return softSecIssuesChecked[trl - 1][question - 1];
    }
  }

  void setTrl(int trl) {
    this.trl = trl;
    notifyListeners();
  }

  void setQuestion(int question) {
    this.question = question;
    notifyListeners();
  }

  void setHardware() {
    isHardwareSelected = true;
    notifyListeners();
  }

  void setSoftware() {
    isHardwareSelected = false;
    notifyListeners();
  }

  String getPDFAssetPath() {
    if (question < 10) {
      return isHardwareSelected
          ? '${Constants.pdfsPath}h${trl}0$question.pdf'
          : '${Constants.pdfsPath}s${trl}0$question.pdf';
    } else {
      return isHardwareSelected
          ? '${Constants.pdfsPath}h$trl$question.pdf'
          : '${Constants.pdfsPath}s$trl$question.pdf';
    }
  }
}
