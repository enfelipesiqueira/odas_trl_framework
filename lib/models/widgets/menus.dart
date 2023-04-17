import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:odas_trl_framework/constants/constants.dart';
import 'package:odas_trl_framework/providers/auth/auth_provider.dart';
import 'package:odas_trl_framework/routes.dart';
import 'package:provider/provider.dart';

import '../user_model.dart';
import 'widgets.dart';

class MenuBar2 extends StatelessWidget {
  const MenuBar2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
            margin: const EdgeInsets.symmetric(vertical: 30),
            child: Row(children: <Widget>[
              StreamBuilder(
                  stream: authProvider.user,
                  builder: (context, snapshot) {
                    final UserModel? user = snapshot.data;
                    return Text(user != null ? 'Usuário: ${user.email!}' : '');
                  }),
            ])
            //Buttons.logout(context),
            ),
        Container(
            height: 1,
            margin: const EdgeInsets.only(bottom: 30),
            color: const Color(0xFFEEEEEE)),
      ],
    );
  }
}

class Menus {
  static Widget menuTop(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          child: Align(
            alignment: Alignment.topRight,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  StreamBuilder(
                    stream: authProvider.user,
                    builder: (context, snapshot) {
                      final UserModel? user = snapshot.data;
                      return Text(user != null ? 'User: ${user.email!}' : '');
                    },
                  ),
                  SzBx.gap10H(),
                  InkWell(
                    child: Icon(
                      Icons.settings,
                      color: Colors.deepOrange[900],
                      size: 30.0,
                    ),
                    onTap: () {
                      Navigator.of(context).pushNamed(Routes.setting);
                    },
                  ),
                ]),
          ),
          //Buttons.logout(context),
        ),
        Container(
            height: 1,
            margin: const EdgeInsets.only(bottom: 30),
            color: const Color(0xFFEEEEEE)),
      ],
    );
  }
}
