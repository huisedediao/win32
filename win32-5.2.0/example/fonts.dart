// Copyright (c) 2020, Dart | Windows.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// Enumerate the fonts installed on this system

import 'dart:ffi';

import 'package:ffi/ffi.dart';
import 'package:win32/win32.dart';

final fontNames = <String>[];

int enumerateFonts(
    Pointer<LOGFONT> logFont, Pointer<TEXTMETRIC> _, int __, int ___) {
  // Get extended information from the font
  final logFontEx = logFont.cast<ENUMLOGFONTEX>();

  fontNames.add(logFontEx.ref.elfFullName);
  return TRUE; // continue enumeration
}

void main() {
  final hDC = GetDC(NULL);
  final searchFont = calloc<LOGFONT>()..ref.lfCharSet = ANSI_CHARSET;
  final lpProc = NativeCallable<EnumFontFamExProc>.isolateLocal(
    enumerateFonts,
    exceptionalReturn: 0,
  );

  EnumFontFamiliesEx(hDC, searchFont, lpProc.nativeFunction, 0, 0);
  lpProc.close();
  fontNames.sort();

  print('${fontNames.length} font families discovered.');
  for (final font in fontNames) {
    print(font);
  }

  free(searchFont);
}
