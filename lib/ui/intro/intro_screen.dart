import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:odas_trl_framework/constants/constants.dart';
import 'package:odas_trl_framework/models/user_model.dart';
import 'package:odas_trl_framework/models/widgets/sizedboxes.dart';
import 'package:odas_trl_framework/restart_app.dart';
import 'package:odas_trl_framework/routes.dart';
import 'package:provider/provider.dart';

import '../../models/widgets/buttons.dart';
import '../../models/widgets/widgets.dart';
import '../../providers/auth/auth_provider.dart';
import 'package:odas_trl_framework/models/widgets/widgets.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    return Scaffold(
      /*appBar: AppBar(
        title: StreamBuilder(
            stream: authProvider.user,
            builder: (context, snapshot) {
              final UserModel? user = snapshot.data as UserModel?;
              return Text(user != null ? user.email! : '');
            }),
      ),*/
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              // Widgets do layout coluna
              children: <Widget>[
                Menus.menuTop(context),
                //MenuBar2(),
                Image.asset(
                  Constants.imgLogo,
                  width: 400,
                  fit: BoxFit.fitWidth,
                ),
                SzBx.gap30V(),
                const Text(Constants.appDescription),
                SzBx.gap30V(),
                Buttons.bt1(
                  Constants.buttonStart,
                  Colors.blue,
                  () {
                    Navigator.of(context).pushNamed(Routes.home);
                  },
                ),
              ]),
        ),
      ),
    );
  }
}
