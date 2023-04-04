import 'package:flutter/material.dart';

import '../theme/pallete.dart';

final lightTheme = ThemeData(
  colorScheme: ThemeData.light().colorScheme.copyWith(
        primary: Colors.white,
        onPrimary: Colors.black,
        secondary: Colors.lightBlueAccent,
        onSecondary: Colors.white,
         onPrimaryContainer: Colors.white,

      ),
);

final darkTheme = ThemeData.dark().copyWith(
  colorScheme: ThemeData.dark().colorScheme.copyWith(
        primary: Colors.black,
        onPrimary: Colors.white,
        secondary: Colors.blueGrey,
        onSecondary: Colors.white,
        onPrimaryContainer: Colors.grey[900],
      ),
);
