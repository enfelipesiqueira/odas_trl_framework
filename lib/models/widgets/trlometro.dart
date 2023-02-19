import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class Trlometro extends StatefulWidget {
  const Trlometro({Key? key}) : super(key: key);

  @override
  State<Trlometro> createState() => _TrlometroState();
}

class _TrlometroState extends State<Trlometro> {
  @override
  Widget build(BuildContext context) {
    return SfRadialGauge(
      axes: <RadialAxis>[
        RadialAxis(
            pointers: <GaugePointer>[NeedlePointer(value: 10)],
            showLabels: false,
            showAxisLine: false,
            showTicks: false,
            minimum: 0,
            maximum: 100,
            ranges: <GaugeRange>[
              /*
                GaugeRange(
                    startValue: 0,
                    endValue: 10,
                    startWidth: 0.5,
                    endWidth: 0.5,
                    color: Colors.grey,
                  label: 'TRL 0',labelStyle: GaugeTextStyle(fontFamily: 'Times', fontSize:   20, fontWeight: FontWeight.bold),
                  sizeUnit: GaugeSizeUnit.factor
                  ),*/
              GaugeRange(
                  startValue: 5,
                  endValue: 15,
                  startWidth: 0.5,
                  endWidth: 0.5,
                  color: Colors.red[300],
                  label: 'TRL 1',
                  labelStyle: GaugeTextStyle(
                      fontFamily: 'Times',
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                  sizeUnit: GaugeSizeUnit.factor),
              GaugeRange(
                  startValue: 15,
                  endValue: 25,
                  startWidth: 0.5,
                  endWidth: 0.5,
                  color: Colors.red[400],
                  label: 'TRL 2',
                  labelStyle: GaugeTextStyle(
                      fontFamily: 'Times',
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                  sizeUnit: GaugeSizeUnit.factor),
              GaugeRange(
                  startValue: 25,
                  endValue: 35,
                  startWidth: 0.5,
                  endWidth: 0.5,
                  color: Colors.yellow[700],
                  label: 'TRL 3',
                  labelStyle: GaugeTextStyle(
                      fontFamily: 'Times',
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                  sizeUnit: GaugeSizeUnit.factor),
              GaugeRange(
                  startValue: 35,
                  endValue: 45,
                  startWidth: 0.5,
                  endWidth: 0.5,
                  color: Colors.yellow[800],
                  label: 'TRL 4',
                  labelStyle: GaugeTextStyle(
                      fontFamily: 'Times',
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                  sizeUnit: GaugeSizeUnit.factor),
              GaugeRange(
                  startValue: 45,
                  endValue: 55,
                  startWidth: 0.5,
                  endWidth: 0.5,
                  color: Colors.blue,
                  label: 'TRL 5',
                  labelStyle: GaugeTextStyle(
                      fontFamily: 'Times',
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                  sizeUnit: GaugeSizeUnit.factor),
              GaugeRange(
                  startValue: 55,
                  endValue: 65,
                  startWidth: 0.5,
                  endWidth: 0.5,
                  color: Colors.blue[600],
                  label: 'TRL 6',
                  labelStyle: GaugeTextStyle(
                      fontFamily: 'Times',
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                  sizeUnit: GaugeSizeUnit.factor),
              GaugeRange(
                  startValue: 65,
                  endValue: 75,
                  startWidth: 0.5,
                  endWidth: 0.5,
                  color: Colors.green[600],
                  label: 'TRL 7',
                  labelStyle: GaugeTextStyle(
                      fontFamily: 'Times',
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                  sizeUnit: GaugeSizeUnit.factor),
              GaugeRange(
                  startValue: 75,
                  endValue: 85,
                  startWidth: 0.5,
                  endWidth: 0.5,
                  color: Colors.green[700],
                  label: 'TRL 8',
                  labelStyle: GaugeTextStyle(
                      fontFamily: 'Times',
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                  sizeUnit: GaugeSizeUnit.factor),
              GaugeRange(
                  startValue: 85,
                  endValue: 95,
                  startWidth: 0.5,
                  endWidth: 0.5,
                  color: Colors.green[800],
                  label: 'TRL 9',
                  labelStyle: GaugeTextStyle(
                      fontFamily: 'Times',
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                  sizeUnit: GaugeSizeUnit.factor),
            ],
            annotations: <GaugeAnnotation>[
              GaugeAnnotation(
                  angle: 90,
                  positionFactor: 0.5,
                  widget: Text(
                    'TRL 1',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 50),
                  ))
            ]),
      ],
    );
  }
}
