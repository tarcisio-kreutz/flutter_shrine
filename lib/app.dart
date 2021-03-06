// Copyright 2014 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

import 'package:flutter_shrine/backdrop.dart';
import 'package:flutter_shrine/category_menu_page.dart';
import 'package:flutter_shrine/colors.dart';
import 'package:flutter_shrine/expanding_bottom_sheet.dart';
import 'package:flutter_shrine/home.dart';
import 'package:flutter_shrine/login.dart';
import 'package:flutter_shrine/supplemental/cut_corners_border.dart';
import 'package:flutter_shrine/model/app_state_model.dart';

import 'package:scoped_model/scoped_model.dart';

class ShrineApp extends StatefulWidget {
  @override
  _ShrineAppState createState() => _ShrineAppState();
}

class _ShrineAppState extends State<ShrineApp> with SingleTickerProviderStateMixin {
  // Controller to coordinate both the opening/closing of backdrop and sliding
  // of expanding bottom sheet
  AnimationController _controller;
  AppStateModel model;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 450),
      value: 1.0,
    );
    model = AppStateModel()..loadProducts();
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModel<AppStateModel>(
      model: model,
      child: MaterialApp(
        title: 'Shrine',
        home: HomePage(
          backdrop: Backdrop(
            frontLayer: const ProductPage(),
            backLayer: CategoryMenuPage(onCategoryTap: () => _controller.forward()),
            frontTitle: const Text('SHRInE'),
            backTitle: const Text('MENU'),
            controller: _controller,
          ),
          expandingBottomSheet: ExpandingBottomSheet(hideController: _controller),
        ),
        initialRoute: '/login',
        onGenerateRoute: _getRoute,
        // Copy the platform from the main theme in order to support platform
        // toggling from the Gallery options menu.
        theme: _kShrineTheme.copyWith(platform: Theme.of(context).platform),
      ),
    );
  }
}

Route<dynamic> _getRoute(RouteSettings settings) {
  if (settings.name != '/login') {
    return null;
  }

  return MaterialPageRoute<void>(
    settings: settings,
    builder: (BuildContext context) => LoginPage(),
    fullscreenDialog: true,
  );
}

final ThemeData _kShrineTheme = _buildShrineTheme();

IconThemeData _customIconTheme(IconThemeData original) {
  return original.copyWith(color: kShrineBrown900);
}

ThemeData _buildShrineTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
    colorScheme: kShrineColorScheme,
    accentColor: kShrineBrown900,
    primaryColor: kShrinePink100,
    buttonColor: kShrinePink100,
    scaffoldBackgroundColor: kShrineBackgroundWhite,
    cardColor: kShrineBackgroundWhite,
    textSelectionColor: kShrinePink100,
    errorColor: kShrineErrorRed,
    buttonTheme: const ButtonThemeData(
      colorScheme: kShrineColorScheme,
      textTheme: ButtonTextTheme.normal,
    ),
    primaryIconTheme: _customIconTheme(base.iconTheme),
    inputDecorationTheme: const InputDecorationTheme(border: CutCornersBorder()),
    textTheme: _buildShrineTextTheme(base.textTheme),
    primaryTextTheme: _buildShrineTextTheme(base.primaryTextTheme),
    accentTextTheme: _buildShrineTextTheme(base.accentTextTheme),
    iconTheme: _customIconTheme(base.iconTheme),
  );
}

TextTheme _buildShrineTextTheme(TextTheme base) {
  return base.copyWith(
    headline: base.headline.copyWith(fontWeight: FontWeight.w500),
    //headline6: base.headline6.copyWith(fontSize: 18.0),
    caption: base.caption.copyWith(fontWeight: FontWeight.w400, fontSize: 14.0),
    body1: base.body1.copyWith(fontWeight: FontWeight.w500, fontSize: 16.0),
    button: base.button.copyWith(fontWeight: FontWeight.w500, fontSize: 14.0),
  ).apply(
    fontFamily: 'Raleway',
    displayColor: kShrineBrown900,
    bodyColor: kShrineBrown900,
  );
}

const ColorScheme kShrineColorScheme = ColorScheme(
  primary: kShrinePink100,
  primaryVariant: kShrineBrown900,
  secondary: kShrinePink50,
  secondaryVariant: kShrineBrown900,
  surface: kShrineSurfaceWhite,
  background: kShrineBackgroundWhite,
  error: kShrineErrorRed,
  onPrimary: kShrineBrown900,
  onSecondary: kShrineBrown900,
  onSurface: kShrineBrown900,
  onBackground: kShrineBrown900,
  onError: kShrineSurfaceWhite,
  brightness: Brightness.light,
);
