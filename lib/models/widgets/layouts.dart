import 'package:flutter/material.dart';

class Layouts {
  static Widget layout(Widget child) {
    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 32),
              child: child,
            ),
          ),
        ],
      ),
    );
  }
}
