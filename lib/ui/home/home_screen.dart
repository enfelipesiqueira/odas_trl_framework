import 'package:flutter/material.dart';
import 'package:odas_trl_framework/constants/constants.dart';
import 'package:odas_trl_framework/models/widgets/gauges_elements.dart';
import 'package:odas_trl_framework/models/widgets/menus.dart';
import 'package:odas_trl_framework/providers/trl/trl_provider.dart';
import 'package:odas_trl_framework/routes.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import '../../models/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    
    return Layouts.layout(Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            // Widgets do layout coluna
            children: [
              Menus.menuTop(context),
              const SizedBox(
                height: 70,
              ),
              SfRadialGauge(
                axes: <RadialAxis>[
                  RadialAxis(
                    startAngle: 180,
                    endAngle: 360,
                    maximum: 90,
                    radiusFactor: 1.5,
                    showTicks: false,
                    showAxisLine: false,
                    showLabels: false,
                    showFirstLabel: false,
                    showLastLabel: false,
                    ranges: GaugesElements.grs(
                      [0, 20, 40, 60, 90],
                      Colors.brown,
                      [
                        'Escritório',
                        'Ambiente \nde Laboratório',
                        'Ambiente \nRelevante',
                        'Ambiente \nOperacional'
                      ],
                      0.12,
                    ),
                  ),
                  RadialAxis(
                    startAngle: 180,
                    endAngle: 360,
                    maximum: 90,
                    radiusFactor: 1.31,
                    showTicks: false,
                    showAxisLine: false,
                    showLabels: false,
                    showFirstLabel: false,
                    showLastLabel: false,
                    ranges: GaugesElements.grs(
                      [10, 40, 70, 90],
                      Colors.amber,
                      [
                        'Pesquisa para \ncomprovar viabilidade',
                        'Demonstração \nde Tecnologia',
                        'Teste, inicialização e \noperações do sistema',
                      ],
                      0.18,
                    ),
                  ),
                  RadialAxis(
                    startAngle: 180,
                    endAngle: 360,
                    maximum: 90,
                    radiusFactor: 1.065,
                    showTicks: false,
                    showAxisLine: false,
                    showLabels: false,
                    showFirstLabel: false,
                    showLastLabel: false,
                    ranges: GaugesElements.grs(
                      [0, 30, 60, 80],
                      Colors.purple,
                      [
                        'Pesquisa de \nTecnologia Básica',
                        'Desenvolvimento \nde Tecnologia',
                        'Desenvolvimento \nde sistema/\nsubsistemas',
                      ],
                      0.30,
                    ),
                  ),
                  RadialAxis(
                    startAngle: 180,
                    endAngle: 360,
                    maximum: 90,
                    radiusFactor: 0.74,
                    showTicks: false,
                    showAxisLine: false,
                    showLabels: false,
                    showFirstLabel: false,
                    showLastLabel: false,
                    ranges: GaugesElements.grsTRL(
                      Colors.blue,
                      0.2,
                    ),
                    pointers: <GaugePointer>[
                      NeedlePointer(
                        needleColor: Colors.blue.shade900.withOpacity(0.5),
                        needleEndWidth: 5,
                        needleLength: 0.7,
                        value: 20,
                        enableAnimation: true,
                        animationDuration: 2000,
                        animationType: AnimationType.elasticOut,
                        knobStyle: KnobStyle(knobRadius: 0.08),
                      ),
                      RangePointer(
                        sizeUnit: GaugeSizeUnit.factor,
                        width: 1,
                        //pointerOffset: 0,
                        value: 20,
                        animationType: AnimationType.easeInCirc,
                        enableAnimation: true,
                        color: Colors.blue.shade900.withOpacity(0.1),
                      ),
                    ],
                    annotations: <GaugeAnnotation>[
                      GaugeAnnotation(
                          widget: Text('Hardware',
                              style: TextStyle(
                                  color: Colors.blue[900],
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25)),
                          angle: 270,
                          positionFactor: 0.3)
                    ],
                  ),

                  // S O F T W A R E

                  RadialAxis(
                    isInversed: true,
                    startAngle: 0,
                    endAngle: 180,
                    maximum: 90,
                    radiusFactor: 1.5,
                    showTicks: false,
                    showAxisLine: false,
                    showLabels: false,
                    showFirstLabel: false,
                    showLastLabel: false,
                    ranges: GaugesElements.grs(
                      [0, 20, 40, 60, 90],
                      Colors.brown,
                      [
                        'Escritório',
                        'Ambiente \nde Laboratório',
                        'Ambiente \nRelevante',
                        'Ambiente \nOperacional'
                      ],
                      0.12,
                    ),
                  ),
                  RadialAxis(
                    isInversed: true,
                    startAngle: 0,
                    endAngle: 180,
                    maximum: 90,
                    radiusFactor: 1.31,
                    showTicks: false,
                    showAxisLine: false,
                    showLabels: false,
                    showFirstLabel: false,
                    showLastLabel: false,
                    ranges: GaugesElements.grs(
                      [10, 40, 70, 90],
                      Colors.amber,
                      [
                        'Pesquisa para \ncomprovar viabilidade',
                        'Demonstração \nde Tecnologia',
                        'Teste, inicialização e \noperações do sistema',
                      ],
                      0.18,
                    ),
                  ),
                  RadialAxis(
                    isInversed: true,
                    startAngle: 0,
                    endAngle: 180,
                    maximum: 90,
                    radiusFactor: 1.065,
                    showTicks: false,
                    showAxisLine: false,
                    showLabels: false,
                    showFirstLabel: false,
                    showLastLabel: false,
                    ranges: GaugesElements.grs(
                      [0, 30, 60, 80],
                      Colors.purple,
                      [
                        'Pesquisa de \nTecnologia Básica',
                        'Desenvolvimento \nde Tecnologia',
                        'Desenvolvimento \nde sistema/\nsubsistemas',
                      ],
                      0.30,
                    ),
                  ),
                  RadialAxis(
                    isInversed: true,
                    startAngle: 0,
                    endAngle: 180,
                    maximum: 90,
                    radiusFactor: 0.74,
                    showTicks: false,
                    showAxisLine: false,
                    showLabels: false,
                    showFirstLabel: false,
                    showLastLabel: false,
                    ranges: GaugesElements.grsTRL(
                      Colors.green,
                      0.2,
                    ),
                    pointers: <GaugePointer>[
                      NeedlePointer(
                        needleColor: Colors.green.shade900.withOpacity(0.5),
                        needleEndWidth: 5,
                        needleLength: 0.7,
                        value: 26,
                        enableAnimation: true,
                        animationDuration: 2000,
                        animationType: AnimationType.elasticOut,
                        knobStyle: KnobStyle(knobRadius: 0),
                      ),
                      RangePointer(
                        sizeUnit: GaugeSizeUnit.factor,
                        width: 1,
                        //pointerOffset: 0,
                        value: 26,
                        animationType: AnimationType.easeInCirc,
                        enableAnimation: true,
                        color: Colors.green.shade900.withOpacity(0.1),
                      ),
                    ],
                    annotations: <GaugeAnnotation>[
                      GaugeAnnotation(
                          widget: Text('Software',
                              style: TextStyle(
                                  color: Colors.green[900],
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25)),
                          angle: 90,
                          positionFactor: 0.3)
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 100,
              ),
              Align(
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // Widgets do layout linha
                  children: [
                    InkWell(
                      child: Column(
                        children: <Widget>[
                          const Icon(
                            Icons.settings,
                            color: Colors.blue,
                            size: 80.0,
                          ),
                          Texts.txt1(Constants.buttonDesingParam),
                        ],
                      ),
                      onTap: () {},
                    ),
                    Column(
                      children: <Widget>[
                        const Text(Constants.tipsTrlometro),
                        SzBx.gap30V(),
                        Buttons.bt1('Novo Projeto', Colors.black, () {}),
                        SzBx.gap30V(),
                        Buttons.bt1('Abrir Projeto', Colors.grey, () {}),
                      ],
                    ),
                    Column(children: <Widget>[
                      InkWell(
                        child: Row(
                          children: <Widget>[
                            Icon(
                              Icons.assessment_outlined,
                              color: Colors.blue[900],
                              size: 60.0,
                            ),
                            Texts.txt1(Constants.buttonAssessHardware),
                          ],
                        ),
                        onTap: () {
                          var trl = context.read<TrlProvider>();
                          trl.setHardware();
                          Navigator.of(context).pushNamed(Routes.trl);
                        },
                      ),
                      InkWell(
                        child: Row(
                          children: <Widget>[
                            Icon(
                              Icons.assessment_outlined,
                              color: Colors.green[900],
                              size: 60.0,
                            ),
                            Texts.txt1(Constants.buttonAssessSoftware),
                          ],
                        ),
                        onTap: () {
                          var trl = context.read<TrlProvider>();
                          trl.setSoftware();
                          Navigator.of(context).pushNamed(Routes.trl);
                        },
                      ),
                    ]),
                  ],
                ),
              ),
              SzBx.gap30V(),
              // Botão INTRO
              Buttons.bt1(
                Constants.buttonIntro,
                Colors.green,
                () {
                  Navigator.pushNamed(
                    context,
                    Routes.intro,
                  );
                },
              ),
            ],
          ));
    /*
    Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            // Widgets do layout coluna
            children: [
              Menus.menuTop(context),
              const SizedBox(
                height: 70,
              ),
              SfRadialGauge(
                axes: <RadialAxis>[
                  RadialAxis(
                    startAngle: 180,
                    endAngle: 360,
                    maximum: 90,
                    radiusFactor: 1.5,
                    showTicks: false,
                    showAxisLine: false,
                    showLabels: false,
                    showFirstLabel: false,
                    showLastLabel: false,
                    ranges: GaugesElements.grs(
                      [0, 20, 40, 60, 90],
                      Colors.brown,
                      [
                        'Escritório',
                        'Ambiente \nde Laboratório',
                        'Ambiente \nRelevante',
                        'Ambiente \nOperacional'
                      ],
                      0.12,
                    ),
                  ),
                  RadialAxis(
                    startAngle: 180,
                    endAngle: 360,
                    maximum: 90,
                    radiusFactor: 1.31,
                    showTicks: false,
                    showAxisLine: false,
                    showLabels: false,
                    showFirstLabel: false,
                    showLastLabel: false,
                    ranges: GaugesElements.grs(
                      [10, 40, 70, 90],
                      Colors.amber,
                      [
                        'Pesquisa para \ncomprovar viabilidade',
                        'Demonstração \nde Tecnologia',
                        'Teste, inicialização e \noperações do sistema',
                      ],
                      0.18,
                    ),
                  ),
                  RadialAxis(
                    startAngle: 180,
                    endAngle: 360,
                    maximum: 90,
                    radiusFactor: 1.065,
                    showTicks: false,
                    showAxisLine: false,
                    showLabels: false,
                    showFirstLabel: false,
                    showLastLabel: false,
                    ranges: GaugesElements.grs(
                      [0, 30, 60, 80],
                      Colors.purple,
                      [
                        'Pesquisa de \nTecnologia Básica',
                        'Desenvolvimento \nde Tecnologia',
                        'Desenvolvimento \nde sistema/\nsubsistemas',
                      ],
                      0.30,
                    ),
                  ),
                  RadialAxis(
                    startAngle: 180,
                    endAngle: 360,
                    maximum: 90,
                    radiusFactor: 0.74,
                    showTicks: false,
                    showAxisLine: false,
                    showLabels: false,
                    showFirstLabel: false,
                    showLastLabel: false,
                    ranges: GaugesElements.grsTRL(
                      Colors.blue,
                      0.2,
                    ),
                    pointers: <GaugePointer>[
                      NeedlePointer(
                        needleColor: Colors.blue.shade900.withOpacity(0.5),
                        needleEndWidth: 5,
                        needleLength: 0.7,
                        value: 20,
                        enableAnimation: true,
                        animationDuration: 2000,
                        animationType: AnimationType.elasticOut,
                        knobStyle: KnobStyle(knobRadius: 0.08),
                      ),
                      RangePointer(
                        sizeUnit: GaugeSizeUnit.factor,
                        width: 1,
                        //pointerOffset: 0,
                        value: 20,
                        animationType: AnimationType.easeInCirc,
                        enableAnimation: true,
                        color: Colors.blue.shade900.withOpacity(0.1),
                      ),
                    ],
                    annotations: <GaugeAnnotation>[
                      GaugeAnnotation(
                          widget: Text('Hardware',
                              style: TextStyle(
                                  color: Colors.blue[900],
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25)),
                          angle: 270,
                          positionFactor: 0.3)
                    ],
                  ),

                  // S O F T W A R E

                  RadialAxis(
                    isInversed: true,
                    startAngle: 0,
                    endAngle: 180,
                    maximum: 90,
                    radiusFactor: 1.5,
                    showTicks: false,
                    showAxisLine: false,
                    showLabels: false,
                    showFirstLabel: false,
                    showLastLabel: false,
                    ranges: GaugesElements.grs(
                      [0, 20, 40, 60, 90],
                      Colors.brown,
                      [
                        'Escritório',
                        'Ambiente \nde Laboratório',
                        'Ambiente \nRelevante',
                        'Ambiente \nOperacional'
                      ],
                      0.12,
                    ),
                  ),
                  RadialAxis(
                    isInversed: true,
                    startAngle: 0,
                    endAngle: 180,
                    maximum: 90,
                    radiusFactor: 1.31,
                    showTicks: false,
                    showAxisLine: false,
                    showLabels: false,
                    showFirstLabel: false,
                    showLastLabel: false,
                    ranges: GaugesElements.grs(
                      [10, 40, 70, 90],
                      Colors.amber,
                      [
                        'Pesquisa para \ncomprovar viabilidade',
                        'Demonstração \nde Tecnologia',
                        'Teste, inicialização e \noperações do sistema',
                      ],
                      0.18,
                    ),
                  ),
                  RadialAxis(
                    isInversed: true,
                    startAngle: 0,
                    endAngle: 180,
                    maximum: 90,
                    radiusFactor: 1.065,
                    showTicks: false,
                    showAxisLine: false,
                    showLabels: false,
                    showFirstLabel: false,
                    showLastLabel: false,
                    ranges: GaugesElements.grs(
                      [0, 30, 60, 80],
                      Colors.purple,
                      [
                        'Pesquisa de \nTecnologia Básica',
                        'Desenvolvimento \nde Tecnologia',
                        'Desenvolvimento \nde sistema/\nsubsistemas',
                      ],
                      0.30,
                    ),
                  ),
                  RadialAxis(
                    isInversed: true,
                    startAngle: 0,
                    endAngle: 180,
                    maximum: 90,
                    radiusFactor: 0.74,
                    showTicks: false,
                    showAxisLine: false,
                    showLabels: false,
                    showFirstLabel: false,
                    showLastLabel: false,
                    ranges: GaugesElements.grsTRL(
                      Colors.green,
                      0.2,
                    ),
                    pointers: <GaugePointer>[
                      NeedlePointer(
                        needleColor: Colors.green.shade900.withOpacity(0.5),
                        needleEndWidth: 5,
                        needleLength: 0.7,
                        value: 26,
                        enableAnimation: true,
                        animationDuration: 2000,
                        animationType: AnimationType.elasticOut,
                        knobStyle: KnobStyle(knobRadius: 0),
                      ),
                      RangePointer(
                        sizeUnit: GaugeSizeUnit.factor,
                        width: 1,
                        //pointerOffset: 0,
                        value: 26,
                        animationType: AnimationType.easeInCirc,
                        enableAnimation: true,
                        color: Colors.green.shade900.withOpacity(0.1),
                      ),
                    ],
                    annotations: <GaugeAnnotation>[
                      GaugeAnnotation(
                          widget: Text('Software',
                              style: TextStyle(
                                  color: Colors.green[900],
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25)),
                          angle: 90,
                          positionFactor: 0.3)
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 100,
              ),
              Align(
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // Widgets do layout linha
                  children: [
                    InkWell(
                      child: Column(
                        children: <Widget>[
                          const Icon(
                            Icons.settings,
                            color: Colors.blue,
                            size: 80.0,
                          ),
                          Texts.txt1(Constants.buttonDesingParam),
                        ],
                      ),
                      onTap: () {},
                    ),
                    Column(
                      children: <Widget>[
                        const Text(Constants.tipsTrlometro),
                        SzBx.gap30V(),
                        Buttons.bt1('Novo Projeto', Colors.black, () {}),
                        SzBx.gap30V(),
                        Buttons.bt1('Abrir Projeto', Colors.grey, () {}),
                      ],
                    ),
                    Column(children: <Widget>[
                      InkWell(
                        child: Row(
                          children: <Widget>[
                            Icon(
                              Icons.assessment_outlined,
                              color: Colors.blue[900],
                              size: 60.0,
                            ),
                            Texts.txt1(Constants.buttonAssessHardware),
                          ],
                        ),
                        onTap: () {
                          var trl = context.read<TrlProvider>();
                          trl.setHardware();
                          Navigator.of(context).pushNamed(Routes.trl);
                        },
                      ),
                      InkWell(
                        child: Row(
                          children: <Widget>[
                            Icon(
                              Icons.assessment_outlined,
                              color: Colors.green[900],
                              size: 60.0,
                            ),
                            Texts.txt1(Constants.buttonAssessSoftware),
                          ],
                        ),
                        onTap: () {
                          var trl = context.read<TrlProvider>();
                          trl.setSoftware();
                          Navigator.of(context).pushNamed(Routes.trl);
                        },
                      ),
                    ]),
                  ],
                ),
              ),
              SzBx.gap30V(),
              // Botão INTRO
              Buttons.bt1(
                Constants.buttonIntro,
                Colors.green,
                () {
                  Navigator.pushNamed(
                    context,
                    Routes.intro,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );*/
  }
}
