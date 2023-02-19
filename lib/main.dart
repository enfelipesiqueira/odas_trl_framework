import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:odas_trl_framework/my_app.dart';
import 'package:odas_trl_framework/providers/auth/auth_provider.dart';
import 'package:odas_trl_framework/providers/trl/trl_provider.dart';
import 'package:odas_trl_framework/restart_app.dart';
import 'package:odas_trl_framework/services/firestore_database.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
/* Outra abordagem
  FirebaseUIAuth.configureProviders([
    EmailAuthProvider(),
    // ... other providers
  ]);

  runApp(ChangeNotifierProvider(
    create: (context) => AuthProvider2(),
    builder: ((context, child) => const MyApp2()),
  ));

  */

  runApp(
    /*
      * MultiProvider for top services that do not depends on any runtime values
      * such as user uid/email.
       */
    MultiProvider(
      providers: [
        ChangeNotifierProvider<TrlProvider>(
          create: (context) => TrlProvider(),
        ),
        ChangeNotifierProvider<AuthProvider>(
          create: (context) => AuthProvider(),
        ),
      ],
      child: RestartWidget(
        child: MyApp(
          databaseBuilder: (_, uid) => FirestoreDatabase(uid: uid),
          key: const Key('MyApp'),
        ),
      ),
    ),
  );
}
