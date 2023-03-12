import 'package:flutter/material.dart';
import 'package:odas_trl_framework/auth_widget_builder.dart';
import 'package:odas_trl_framework/models/user_model.dart';
import 'package:odas_trl_framework/providers/auth/auth_provider.dart';
import 'package:odas_trl_framework/providers/trl/trl_provider.dart';
import 'package:odas_trl_framework/routes.dart';
import 'package:odas_trl_framework/services/firestore_database.dart';
import 'package:odas_trl_framework/ui/auth/sign_in_screen.dart';
import 'package:odas_trl_framework/ui/home/home_screen.dart';
import 'package:odas_trl_framework/ui/intro/intro_screen.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({required Key key, required this.databaseBuilder})
      : super(key: key);

  // Expose builders for 3rd party services at the root of the widget tree
  // This is useful when mocking services while testing
  final FirestoreDatabase Function(BuildContext context, String uid)
      databaseBuilder;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //{context, data, child}
    return Consumer<TrlProvider>(builder: (_, trlProviderRef, __) {
      return AuthWidgetBuilder(
        databaseBuilder: databaseBuilder,
        builder: (BuildContext context, AsyncSnapshot<UserModel> userSnapshot) {
          return MaterialApp(
            title: 'Ferramenta ODAS-TRL-Framework',
            routes: Routes.routes,
            //theme: AppThemes.lightTheme,
            //darkTheme: AppThemes.darkTheme,
            //themeMode: themeProviderRef.isDarkModeOn
            //    ? ThemeMode.dark
            //    : ThemeMode.light,
            theme: ThemeData(
                // This is the theme of your application.
                //
                // Try running your application with "flutter run". You'll see the
                // application has a blue toolbar. Then, without quitting the app, try
                // changing the primarySwatch below to Colors.green and then invoke
                // "hot reload" (press "r" in the console where you ran "flutter run",
                // or simply save your changes to "hot reload" in a Flutter IDE).
                // Notice that the counter didn't reset back to zero; the application
                // is not restarted.
                primarySwatch: Colors.blue,
                fontFamily: 'RobotoMono'),
            home: Consumer<AuthProvider>(
              builder: (_, authProviderRef, __) {
                /*if (userSnapshot.connectionState == ConnectionState.waiting) {
                print('Snapshot => $userSnapshot');
                return Center(child: Text("Is Loading..."));
              } else if (userSnapshot.hasError) {
                print('Snapshot => $userSnapshot');
                return Center(child: Text("Error: ${userSnapshot.error}"));
              } else if (userSnapshot.hasData) {
                print('Snapshot => $userSnapshot');
                return IntroScreen();
              } else {
                print('Not Logged In!!!');
                print('Snapshot => $userSnapshot');
                return SignInScreen();
              }*/

                if (userSnapshot.connectionState == ConnectionState.active) {
                  print("userSnapshot.data: $userSnapshot.data");
                  return userSnapshot.data?.uid != 'null'
                      ? HomeScreen()
                      : SignInScreen();
                }

                return Material(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          );
        },
        key: Key('AuthWidget'),
      );
    });
  }
}
