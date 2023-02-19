import 'package:flutter/material.dart';

class Constants {
  Constants._();

  static const String introTitle = "Introdução";
  static const String homeTitle = "Home";

  static const String appDescription =
      "O ODAS-TRL é uma ferramenta interativa para medição do nível de maturidade tecnológica "
      "de Sistemas de Aquisição de Dados Oceânicos (ODAS - Ocean Data Acquisition Systems) in situ. A ferramenta apresenta o questionário de avaliação com as questões "
      "relativas a cada nível TRL e, ainda, uma série de procedimentos referentes às questões para transição do nível tecnológico.";

  static const String pdfsPath = "assets/pdfs/";

  static const String imgLogo = "assets/images/logo.png";

  static const String tipsTrlometro =
      'Este é o "Trlômetro". Ele mostra o status tecnológico do seu produto.';

  static const String buttonStart = "INICIAR";
  static const String buttonHome = "HOME";
  static const String buttonIntro = "INTRO";
  static const String buttonDesingParam = "  Parâmetros de Projeto  ";
  static const String buttonAssessHardware = "Avaliar Hardware";
  static const String buttonAssessSoftware = "Avaliar Software";

  var teste = "101";

  static const List<int> sixColorShades = [50, 200, 400, 600, 800, 900];
  static const List<int> nineColorShades = [
    100,
    200,
    300,
    400,
    500,
    600,
    700,
    800,
    900
  ];

  static int codeA = 65;
}
