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

  final wbemcontext = IWbemContext(ptr);
  test('Can instantiate IWbemContext.clone', () {
    expect(wbemcontext.clone, isA<Function>());
  });
  test('Can instantiate IWbemContext.getNames', () {
    expect(wbemcontext.getNames, isA<Function>());
  });
  test('Can instantiate IWbemContext.beginEnumeration', () {
    expect(wbemcontext.beginEnumeration, isA<Function>());
  });
  test('Can instantiate IWbemContext.next', () {
    expect(wbemcontext.next, isA<Function>());
  });
  test('Can instantiate IWbemContext.endEnumeration', () {
    expect(wbemcontext.endEnumeration, isA<Function>());
  });
  test('Can instantiate IWbemContext.setValue', () {
    expect(wbemcontext.setValue, isA<Function>());
  });
  test('Can instantiate IWbemContext.getValue', () {
    expect(wbemcontext.getValue, isA<Function>());
  });
  test('Can instantiate IWbemContext.deleteValue', () {
    expect(wbemcontext.deleteValue, isA<Function>());
  });
  test('Can instantiate IWbemContext.deleteAll', () {
    expect(wbemcontext.deleteAll, isA<Function>());
  });

  free(ptr);
}
