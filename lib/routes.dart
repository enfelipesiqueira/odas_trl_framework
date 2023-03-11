import 'package:flutter/material.dart';
import 'package:odas_trl_framework/ui/auth/sign_in_screen.dart';
import 'package:odas_trl_framework/ui/home/home_screen.dart';
import 'package:odas_trl_framework/ui/overview/overview_screen.dart';
import 'package:odas_trl_framework/ui/intro/intro_screen.dart';
import 'package:odas_trl_framework/ui/procedure/procedure_screen.dart';
import 'package:odas_trl_framework/ui/setting/setting_screen.dart';
import 'package:odas_trl_framework/ui/trl/trl_screen.dart';

class Routes {
  Routes._(); //this is to prevent anyone from instantiate this object

  static const String splash = '/splash';
  static const String login = '/login';
  static const String register = '/register';
  static const String intro = '/intro';
  static const String overview = '/overview';
  static const String home = '/home';
  static const String setting = '/setting';
  static const String procedure = '/procedure';
  static const String trl = '/trl';

  static final routes = <String, WidgetBuilder>{
    //splash: (BuildContext context) => SplashScreen(),
    //register: (BuildContext context) => RegisterScreen(),
    intro: (BuildContext context) => IntroScreen(),
    setting: (BuildContext context) => SettingScreen(),
    home: (BuildContext context) => HomeScreen(),
    overview: (BuildContext context) => OverviewScreen(),
    trl: (BuildContext context) => TrlScreen(),
    procedure: (BuildContext context) => ProcedureScreen(),
    //create_edit_todo: (BuildContext context) => CreateEditTodoScreen(),
    login: (BuildContext context) => SignInScreen(),
  };
}
