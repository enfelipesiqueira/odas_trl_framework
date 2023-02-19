import 'package:flutter/material.dart';

class Texts {
  static Text txt1(String texto) {
    return Text(
      texto,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 18,
      ),
    );
  }
}
