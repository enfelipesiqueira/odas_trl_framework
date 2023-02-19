import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:odas_trl_framework/providers/auth/auth_provider.dart';
import 'package:odas_trl_framework/restart_app.dart';
import 'package:odas_trl_framework/routes.dart';
import 'package:provider/provider.dart';

class Buttons {
  static TextButton bt1(String texto, Color cor, VoidCallback funcao) {
    return TextButton(
      style: TextButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: cor,
        padding: const EdgeInsets.all(16.0),
        textStyle: const TextStyle(fontSize: 20),
      ),
      onPressed: funcao,
      child: Text(texto),
    );
  }

  static ElevatedButton logout(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        _confirmSignOut(context);
      },

      /*() {
        // A outra abordagem
        //FirebaseAuth.instance.signOut();
        final authProvider = Provider.of<AuthProvider>(context, listen: false);

        authProvider.signOut();

        //RestartWidget.restartApp(context);

        Navigator.pop(context);
        Navigator.of(context).pushNamedAndRemoveUntil(
            Routes.login, ModalRoute.withName(Routes.login));
      },*/
      child: const Text("Logout"),
    );
  }

  static _confirmSignOut(BuildContext context) {
    showPlatformDialog(
        context: context,
        builder: (_) => PlatformAlertDialog(
              material: (_, PlatformTarget target) => MaterialAlertDialogData(
                  backgroundColor: Theme.of(context).appBarTheme.color),
              title: const Text('Alerta'),
              content: const Text('Confirma logout?'),
              actions: <Widget>[
                PlatformDialogAction(
                  child: PlatformText('Cancelar'),
                  onPressed: () => Navigator.pop(context),
                ),
                PlatformDialogAction(
                  child: PlatformText('Sim'),
                  onPressed: () {
                    final authProvider =
                        Provider.of<AuthProvider>(context, listen: false);

                    authProvider.signOut();

                    //Navigator.of(context).pushNamed(Routes.login);
/*
                    Navigator.pop(context);
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        Routes.login, ModalRoute.withName(Routes.login));
*/
                    RestartWidget.restartApp(context);
                  },
                )
              ],
            ));
  }
}
