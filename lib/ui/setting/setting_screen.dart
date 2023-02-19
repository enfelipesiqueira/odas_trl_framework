import 'package:flutter/material.dart';

import '../../models/widgets/widgets.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              // Widgets do layout coluna
              children: <Widget>[
                Buttons.logout(context),
              ]),
        ),
      ),
    );
  }
}
