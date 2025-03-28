// Copyright (c) 2020, Dart | Windows.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// Play a sound

import 'dart:io';

import 'package:ffi/ffi.dart';

import 'package:win32/win32.dart';

void main() {
  const logonSound = r'C:\Windows\Media\Windows Logon.wav';

  final file = File(logonSound).existsSync();

  if (!file) {
    print('WAV file missing.');
    exit(1);
  } else {
    final pszLogonSound = logonSound.toNativeUtf16();
    final result = PlaySound(pszLogonSound, NULL, SND_FILENAME | SND_SYNC);

    if (result != TRUE) {
      print('Sound playback failed.');
    }
    free(pszLogonSound);
  }
}
