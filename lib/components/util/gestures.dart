/*---------------------------------------------------------------------------------------------
*  Copyright (c) nt4f04und. All rights reserved.
*  Licensed under the BSD-style license. See LICENSE in the project root for license information.
*--------------------------------------------------------------------------------------------*/

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';

/// All content inside this widget will only take one touch event.
class SingleTouchRecognizerWidget extends StatelessWidget {
  final Widget child;
  SingleTouchRecognizerWidget({this.child});

  @override
  Widget build(BuildContext context) {
    return RawGestureDetector(
      gestures: <Type, GestureRecognizerFactory>{
        _SingleTouchRecognizer:
            GestureRecognizerFactoryWithHandlers<_SingleTouchRecognizer>(
          () => _SingleTouchRecognizer(),
          (_SingleTouchRecognizer instance) {},
        ),
      },
      child: child,
    );
  }
}

class _SingleTouchRecognizer extends OneSequenceGestureRecognizer {
  int _pointer = 0;
  @override
  void addAllowedPointer(PointerDownEvent event) {
    // First register the current pointer so that related events will be handled by this recognizer
    startTrackingPointer(event.pointer);
    // Ignore event if another event is already in progress
    if (_pointer == 0) {
      resolve(GestureDisposition.rejected);
      _pointer = event.pointer;
    } else {
      resolve(GestureDisposition.accepted);
    }
  }

  @override
  String get debugDescription => "single pointer";

  @override
  void didStopTrackingLastPointer(int pointer) {}

  @override
  void handleEvent(PointerEvent event) {
    if (!event.down && event.pointer == _pointer) {
      _pointer = 0;
    }
  }
}
