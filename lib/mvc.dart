///
/// Copyright (C) 2018 Andrious Solutions
///
/// This program is free software; you can redistribute it and/or
/// modify it under the terms of the GNU General Public License
/// as published by the Free Software Foundation; either version 3
/// of the License, or any later version.
///
/// You may obtain a copy of the License at
///
///  http://www.apache.org/licenses/LICENSE-2.0
///
///
/// Unless required by applicable law or agreed to in writing, software
/// distributed under the License is distributed on an "AS IS" BASIS,
/// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
/// See the License for the specific language governing permissions and
/// limitations under the License.
///
///          Created  31 Dec 2018
///
///

export "app.dart";
export 'model.dart';
export 'controller.dart';
export 'view.dart';

import 'package:flutter/material.dart'
    show
        BuildContext,
        Key,
        StatelessWidget,
        Widget,
        Color,
        GenerateAppTitle,
        GlobalKey,
        Locale,
        LocaleResolutionCallback,
        LocalizationsDelegate,
        NavigatorObserver,
        NavigatorState,
        RouteFactory,
        ThemeData,
        TransitionBuilder,
        WidgetBuilder;

import 'app.dart' show App;

import 'controller.dart' show ControllerMVC;

import 'view.dart' show AppController, AppView, LoadingScreen, StateMVC;

/// Passed to runApp() but calls App()
class MVC extends StatelessWidget {
  MVC(
    this.view, {
    this.key,
  }) : super();
  final AppView view;
  final Key key;

  Widget build(BuildContext context) => App(view, key: key);
}

//abstract class StaticState<T extends StatefulWidget> extends StateMVC<T>{
//
//  StaticState(ControllerMVC con): super(con){
//    if(_con == null) _con = con;
//  }
//  /// Now have 'app wide' access to the Controller.
//  static ControllerMVC get con => _con;
//  static ControllerMVC _con;
//}

/// The Controller for a simple app.
class Controller extends ControllerMVC {
  Controller([StateMVC state]): super(state) {
    if (_firstCon == null) _firstCon = this;
  }
  static Controller _firstCon;

  /// Allow for easy access to 'the Controller' throughout the application.
  static Controller get con => _firstCon ?? Controller();
}

/// Passed as 'View' to MVC class for a simple app.
class View extends AppView {
  View({
    this.con,
    this.home,
    GlobalKey<NavigatorState> navigatorKey,
    Map<String, WidgetBuilder> routes,
    String initialRoute,
    RouteFactory onGenerateRoute,
    RouteFactory onUnknownRoute,
    List<NavigatorObserver> navigatorObservers,
    TransitionBuilder builder,
    String title,
    GenerateAppTitle onGenerateTitle,
    ThemeData theme,
    Color color,
    Locale locale,
    Iterable<LocalizationsDelegate<dynamic>> localizationsDelegates,
    LocaleResolutionCallback localeResolutionCallback,
    Iterable<Locale> supportedLocales,
    bool debugShowMaterialGrid,
    bool showPerformanceOverlay,
    bool checkerboardRasterCacheImages,
    bool checkerboardOffscreenLayers,
    bool showSemanticsDebugger,
    bool debugShowCheckedModeBanner,
  }) : super(
          /// Pass these parameters to the class in App.dart.
          controller: AppController(),
          navigatorKey: navigatorKey,
          routes: routes,
          initialRoute: initialRoute,
          onGenerateRoute: onGenerateRoute,
          onUnknownRoute: onUnknownRoute,
          navigatorObservers: navigatorObservers,
          builder: builder,
          title: title,
          onGenerateTitle: onGenerateTitle,
          theme: theme,
          color: color,
          locale: locale,
          localizationsDelegates: localizationsDelegates,
          localeResolutionCallback: localeResolutionCallback,
          supportedLocales: supportedLocales,
          debugShowMaterialGrid: debugShowMaterialGrid,
          showPerformanceOverlay: showPerformanceOverlay,
          checkerboardRasterCacheImages: checkerboardRasterCacheImages,
          checkerboardOffscreenLayers: checkerboardOffscreenLayers,
          showSemanticsDebugger: showSemanticsDebugger,
          debugShowCheckedModeBanner: debugShowCheckedModeBanner,
        ) {
    /// Add the passed Controller to the State's lifecycle.
    this.add(con);
  }

  final ControllerMVC con;
  final Widget home;

  Widget build(BuildContext context) {
    if (home != null) return home;
    return LoadingScreen();
  }
}
