// Copyright (c) 2020, Dart | Windows.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// Tests that Win32 API prototypes can be successfully loaded (i.e. that
// lookupFunction works for all the APIs generated)

// THIS FILE IS GENERATED AUTOMATICALLY AND SHOULD NOT BE EDITED DIRECTLY.

// ignore_for_file: unused_local_variable

@TestOn('windows')

import 'dart:ffi';

import 'package:ffi/ffi.dart';
import 'package:test/test.dart';

import 'package:win32/win32.dart';

void main() {
  final ptr = calloc<COMObject>();

  final audiosessioncontrol = IAudioSessionControl(ptr);
  test('Can instantiate IAudioSessionControl.getState', () {
    expect(audiosessioncontrol.getState, isA<Function>());
  });
  test('Can instantiate IAudioSessionControl.getDisplayName', () {
    expect(audiosessioncontrol.getDisplayName, isA<Function>());
  });
  test('Can instantiate IAudioSessionControl.setDisplayName', () {
    expect(audiosessioncontrol.setDisplayName, isA<Function>());
  });
  test('Can instantiate IAudioSessionControl.getIconPath', () {
    expect(audiosessioncontrol.getIconPath, isA<Function>());
  });
  test('Can instantiate IAudioSessionControl.setIconPath', () {
    expect(audiosessioncontrol.setIconPath, isA<Function>());
  });
  test('Can instantiate IAudioSessionControl.getGroupingParam', () {
    expect(audiosessioncontrol.getGroupingParam, isA<Function>());
  });
  test('Can instantiate IAudioSessionControl.setGroupingParam', () {
    expect(audiosessioncontrol.setGroupingParam, isA<Function>());
  });
  test('Can instantiate IAudioSessionControl.registerAudioSessionNotification',
      () {
    expect(
        audiosessioncontrol.registerAudioSessionNotification, isA<Function>());
  });
  test(
      'Can instantiate IAudioSessionControl.unregisterAudioSessionNotification',
      () {
    expect(audiosessioncontrol.unregisterAudioSessionNotification,
        isA<Function>());
  });

  free(ptr);
}
