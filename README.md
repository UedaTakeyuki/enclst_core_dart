<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/tools/pub/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/to/develop-packages).
-->

[Enclst](https://github.com/UedaTakeyuki/EncLst) library for Dart.

## Features

TODO: List what your package can do. Maybe include images, gifs, or videos.

## Getting started
Install this package as follow:

```
flutter pub add 'enclist_core_dart:{"git":{"url":"https://github.com/UedaTakeyuki/enclst_core_dart","ref":"main"}}'
```

or add following lines on your ```pubspec.yaml```

```
  enclst_core_dart:
    git:
      url: https://github.com/UedaTakeyuki/enclst_core_dart.git
      ref: main
```
## Usage

Import this package as follow:
```
import 'package:enclst_core_dart/enclst_core_dart.dart';
```

Create from Enclst file:
```
final enclst = await Enclst.createFromURL(
        'https://raw.githubusercontent.com/UedaTakeyuki/EncLst/refs/heads/main/examples/EncycloList/lang/fr/journal/journal.enclst');
```

```dart
const like = 'sample';
```

## Additional information

TODO: Tell users more about the package: where to find more information, how to
contribute to the package, how to file issues, what response they can expect
from the package authors, and more.

## API
latest document is available [here](https://uedatakeyuki.github.io/enclst_core_dart/).

## History
- 0.1.0 2024.10.29 created from scratch.