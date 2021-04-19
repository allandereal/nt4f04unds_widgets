/*---------------------------------------------------------------------------------------------
*  Copyright (c) nt4f04und. All rights reserved.
*  Licensed under the BSD-style license. See LICENSE in the project root for license information.
*--------------------------------------------------------------------------------------------*/

import 'package:flutter/material.dart';
import 'package:nt4f04unds_widgets/nt4f04unds_widgets.dart';

/// Screen sizes.
enum ScreenSize { standart, small, tablet }

/// Stores screen width.
///
/// Initialized in the [NFWidgets].
late double screenWidth;

/// Stores screen height.
///
/// Initialized in the [NFWidgets].
late double screenHeight;

/// Store the screen size the applicaiton is running on.
///
/// Initialized in the [NFWidgets].
ScreenSize screen = ScreenSize.standart;

/// Designates whether the the app has standart, medium sized screen - not too small, and not a tabet.
bool get standartScreen => screen == ScreenSize.standart;

/// Designates whether the app is running on very small screen.
bool get smallScreen => screen == ScreenSize.small;

/// Designates whether the app is running on tablet.
bool get tabletScreen => screen == ScreenSize.tablet;

/// Checks the current [screen] size and returns a value dependent on that.
T pickSize<T>(T standart, { T? small, T? tablet }) {
  assert(small != null || tablet != null, 'Must specify at least one additional size for size picker except standart');
  if (small == null) {
    small = standart;
  }
  if (tablet == null) {
    tablet = standart;
  }
  switch (screen) {
    case ScreenSize.standart:
      return standart;
    case ScreenSize.small:
      return small as T;
    case ScreenSize.tablet:
      return tablet as T;
  }
}

/// Updates [screenWidth], [screenHeight] and [screen].
void updateScreenSize() {
  final window = WidgetsBinding.instance?.window;
  if (window == null)
    return;
  final size = MediaQueryData.fromWindow(window).size;
  screenWidth = size.width;
  screenHeight = size.height;
  final shortestSide = size.shortestSide;
  if (shortestSide >= 600) {
    screen = ScreenSize.tablet;
  } else if (shortestSide <= 345) {
    screen = ScreenSize.small;
  } else {
    screen = ScreenSize.standart;
  }
}