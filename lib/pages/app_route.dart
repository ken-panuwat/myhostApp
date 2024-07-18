import 'package:flutter/cupertino.dart';
import 'package:myhost_app/pages/home_page.dart';
import 'package:myhost_app/pages/login.dart';

class AppRoute {
  static const homeRoute = "home";
  static const loginRoute = "login";

  final _route = <String, WidgetBuilder>{
    homeRoute: (context) => HomePage(),
    loginRoute: (context) => LoginPage(),
  };

  get getAll => _route;
}
