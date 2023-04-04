
import '../../theme/pallete.dart';
import 'package:flutter/material.dart';
import '../providers/active_theme_provider.dart';
import 'theme_switch.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
backgroundColor: buttoncolor,
      centerTitle: true,
      title: Text(
        'Mental bridge',
        style: TextStyle(
          color: white,

          fontWeight: FontWeight.w600,
          fontSize: 24
        ),
      ),
      actions: [
        Row(
          children: [
            Consumer(
              builder: (context, ref, child) => Icon(
                ref.watch(activeThemeProvider) == Themes.light
                    ? Icons.light_mode
                    : Icons.dark_mode,
              ),
            ),
            //const SizedBox(width: 2),
            const ThemeSwitch(),
          ],
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
