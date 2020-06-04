///
/// Copyright (C) 2018 Andrious Solutions
///
/// Licensed under the Apache License, Version 2.0 (the "License");
/// you may not use this file except in compliance with the License.
/// You may obtain a copy of the License at
///
///    http://www.apache.org/licenses/LICENSE-2.0
///
/// Unless required by applicable law or agreed to in writing, software
/// distributed under the License is distributed on an "AS IS" BASIS,
/// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
/// See the License for the specific language governing permissions and
/// limitations under the License.
///
///          Created  25 Dec 2018
///
///

/// Material
export 'package:flutter/material.dart' hide runApp;

/// Cupertino
export 'package:flutter/cupertino.dart' hide RefreshCallback, runApp;

/// MVC
export 'package:mvc_pattern/mvc_pattern.dart'
    show AppMVC, ViewMVC, SetState
    hide AppConMVC;

/// App
export 'package:mvc_application/src/view/app.dart'
    show
        App,
        AppView,
        ConConsumer,
        ConnectivityListener,
        ConnectivityResult,
        StateMVC;

/// Supply the custom runApp function
export 'package:mvc_application/src/controller/app.dart' show runApp;

/// Settings
export 'package:mvc_application/src/view/utils/app_settings.dart';

/// Error Handling
export 'package:mvc_application/src/view/utils/error_handler.dart'
    show ErrorHandler, ReportErrorHandler;

/// Screens
export 'package:mvc_application/src/view/utils/loading_screen.dart';

/// Fields
export 'package:mvc_application/src/view/utils/field_widgets.dart';

/// Menus
export 'package:mvc_application/src/view/appmenu.dart' show AppMenu, Menu;

/// UX Utils
export 'package:mvc_application/src/view/uxutils/view.dart';

/// Preferences
export 'package:prefs/prefs.dart' show Prefs;
