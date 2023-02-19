import 'package:flutter/material.dart';
import 'package:odas_trl_framework/models/user_model.dart';
import 'package:odas_trl_framework/providers/auth/auth_provider.dart';
import 'package:odas_trl_framework/services/firestore_database.dart';
import 'package:provider/provider.dart';

/*
* Esta classe é principalmente para ajudar na criação de objetos dependentes do usuário que precisam estar disponíveis para todos os widgets downstream.
* Portanto, este construtor de widgets é obrigatório para viver acima de [MaterialApp].
* Como dependemos do uid para decidir qual tela principal exibir (por exemplo: Home ou Login),
* esta classe ajudará a criar todos os provedores necessários que dependem do uid de dados registrados pelo usuário.
*/
class AuthWidgetBuilder extends StatelessWidget {
  const AuthWidgetBuilder(
      {required Key key, required this.builder, required this.databaseBuilder})
      : super(key: key);
  final Widget Function(BuildContext, AsyncSnapshot<UserModel>) builder;
  final FirestoreDatabase Function(BuildContext context, String uid)
      databaseBuilder;

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthProvider>(context, listen: false);
    return StreamBuilder<UserModel>(
      stream: authService.user,
      builder: (BuildContext context, AsyncSnapshot<UserModel> snapshot) {
        final UserModel? user = snapshot.data;

        if (user != null) {
          /*
           * Para quaisquer outros serviços de Provedor que dependem de dados do usuário, podem ser adicionados à seguinte lista de MultiProvider.
           * Assim que um usuário for detectado, uma reconstrução será iniciada.
            */
          return MultiProvider(
            providers: [
              Provider<UserModel>.value(value: user),
              Provider<FirestoreDatabase>(
                create: (context) => databaseBuilder(context, user.uid),
              ),
            ],
            child: builder(context, snapshot),
          );
        }
        return builder(context, snapshot);
      },
    );
  }
}
