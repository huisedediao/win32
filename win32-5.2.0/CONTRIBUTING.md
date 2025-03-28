# Contributing to Win32

Contributions are very much appreciated. With thousands of Win32 APIs, there's a
lot of ground to cover. Don't hesitate to ask questions.

Some tips:

## Classic Win32 APIs

- When wrapping a Win32 API, use the Unicode (`'W'`) wide variants of these
  APIs, rather than the ANSI (`'A'`) variants. For example:
  [CredWriteW][credwritew_link], rather than [CredWriteA][credwritea_link].

- To create a new API, *don't* edit the main library files themselves; these get
  overwritten. Instead, edit the
  [win32_functions.json][win32_functions_json_link] file and execute the
  `tool\generate.cmd` script to update the library files.

- Structs can be auto-generated by including them in the
  [win32_structs.json][win32_structs_json_link] file and executing the
  `tool\generate.cmd` script, which will generate the corresponding Dart files.

  Once generated, compile the [struct_sizes.cpp][struct_sizes_cpp_link] on a
  `64-bit` machine architecture, typically using the
  [Visual Studio Developer Command Prompt][command_prompt_link] with the
  following command (replace `xxxxx` with the installed Windows SDK build):

  ```cmd
  cl /I "C:\Program Files (x86)\Windows Kits\10\Include\10.0.xxxxx.0\winrt" \
    tool\struct_sizes\struct_sizes.cpp
  ```

  Once compiled, run the resulting `struct_sizes.exe` file located in the
  project root to obtain struct sizes; copy the output directly into the
  `structSizeMap` within the [struct_sizes.dart][struct_sizes_dart_link] file,
  and finally, execute the `tool\generate.cmd` script to generate struct size
  tests for each struct.

- Constants belong in the [constants.dart][constants_dart_link]; please add
  documentation. In rare cases (where the constant is truly self-documenting),
  you may add to the [constants_nodoc.dart][constants_nodoc_dart_link], although
  the goal is to gradually document more constants.

- There are plenty of good existing patterns to build off in these locations;
  try to mirror an existing function if you can for consistency!

- Ideally pull requests for new API submissions include a sample (`example\`
  directory) and some tests (`tests\` directory).

## COM APIs

Begin by editing the [com_types.json][com_types_json_link] file, specifying the
desired COM interface, and then execute the `tool\generate.cmd` script to
generate the relevant class in the `lib\src\com` directory.

[command_prompt_link]: https://learn.microsoft.com/visualstudio/ide/reference/command-prompt-powershell
[com_types_json_link]: https://github.com/dart-windows/win32/tree/main/tool/win32gen/data/com_types.json
[constants_dart_link]: https://github.com/dart-windows/win32/tree/main/lib/src/constants.dart
[constants_nodoc_dart_link]: https://github.com/dart-windows/win32/tree/main/lib/src/constants_nodoc.dart
[credwritea_link]: https://learn.microsoft.com/windows/win32/api/wincred/nf-wincred-credwritea
[credwritew_link]: https://learn.microsoft.com/windows/win32/api/wincred/nf-wincred-credwritew
[struct_sizes_cpp_link]: https://github.com/dart-windows/win32/tree/main/tool/struct_sizes/struct_sizes.cpp
[struct_sizes_dart_link]: https://github.com/dart-windows/win32/tree/main/tool/win32gen/lib/src/model/struct_sizes.dart
[win32_functions_json_link]: https://github.com/dart-windows/win32/tree/main/tool/win32gen/data/win32_functions.json
[win32_structs_json_link]: https://github.com/dart-windows/win32/tree/main/tool/win32gen/data/win32_structs.json
