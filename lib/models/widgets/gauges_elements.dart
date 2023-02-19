import 'package:flutter/material.dart';
import 'package:odas_trl_framework/constants/constants.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class GaugesElements {
  static GaugeRange gr(double startValue, double endValue,
      MaterialColor colorBase, int shade, String label, double width) {
    return GaugeRange(
      startWidth: width,
      endWidth: width,
      startValue: startValue,
      endValue: endValue,
      color: colorBase[shade],
      label: label,
      sizeUnit: GaugeSizeUnit.factor,
      labelStyle: const GaugeTextStyle(
          fontFamily: 'Times', fontSize: 13, fontWeight: FontWeight.normal),
    );
  }

  static List<GaugeRange> grs(List<double> values, MaterialColor colorBase,
      List<String> labels, double width) {
    // O tamanho de 'values' deve ser 1 unidade maior que o tamanho de 'labels'

    List<GaugeRange> gauges = [];
    for (var i = 0; i < labels.length; i++) {
      String label = labels[i];
      double startValue = values[i];
      double endValue = values[i + 1];
      int shade = Constants.sixColorShades[i];
      gauges.add(gr(startValue, endValue, colorBase, shade, label, width));
    }

    return gauges;
  }

  static List<GaugeRange> grsTRL(MaterialColor colorBase, double width) {
    List<GaugeRange> gauges = [];
    for (int i = 0; i < 9; i++) {
      String label = 'TRL ${i + 1}';
      double startValue = (10 * i).toDouble();
      double endValue = 10 * (i + 1);
      int shade = Constants.nineColorShades[i];
      gauges.add(gr(startValue, endValue, colorBase, shade, label, width));
    }

    return gauges;
  }
}
