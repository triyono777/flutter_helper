import 'package:flutter/material.dart';

void pageBack(BuildContext context) => Navigator.of(context).pop();

void pageOpen(BuildContext context, Widget page) => Navigator.push(
      context,
      PageRouteBuilder(pageBuilder: (_, __, ___) => page),
    );

Future<dynamic> pageOpenWithResult(BuildContext context, Widget page) async {
  return await Navigator.push(
    context,
    PageRouteBuilder(pageBuilder: (_, __, ___) => page),
  );
}

void pageOpenAndReplace(BuildContext context, Widget page) => Navigator.pushReplacement(
      context,
      PageRouteBuilder(pageBuilder: (_, __, ___) => page),
    );

void pageOpenAndRemovePrevious(BuildContext context, Widget page) => Navigator.pushAndRemoveUntil(
      context,
      PageRouteBuilder(pageBuilder: (_, __, ___) => page),
      ModalRoute.withName(''),
    );

void pageOpenNamed(BuildContext context, String route, {Object? arguments}) =>
    Navigator.pushNamed(context, route, arguments: arguments);

Future<dynamic> pageOpenWithResultNamed(BuildContext context, String route, {Object? arguments}) async {
  return await Navigator.pushNamed(context, route, arguments: arguments);
}

void pageOpenAndReplaceNamed(BuildContext context, String route, {Object? arguments}) => Navigator.pushReplacementNamed(
      context,
      route,
      arguments: arguments,
    );

void pageOpenAndRemovePreviousNamed(BuildContext context, String route) => Navigator.pushNamedAndRemoveUntil(
      context,
      route,
      ModalRoute.withName(''),
    );
