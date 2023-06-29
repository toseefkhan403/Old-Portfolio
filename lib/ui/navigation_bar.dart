import 'dart:math';

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:url_launcher/url_launcher.dart';

class NavigationBar extends StatefulWidget {
  final double topPadding;

  const NavigationBar({this.topPadding = 30, Key? key}) : super(key: key);

  @override
  State<NavigationBar> createState() => _NavigationBarState();
}

class _NavigationBarState extends State<NavigationBar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 40.0, top: widget.topPadding, right: 50),
      child: Row(
        children: [
          themeButton(),
          Spacer(),
          navigationItem(Icon(Feather.mail), "mailto:toseefkhan403@gmail.com?subject=Hey!%20Let's%20Connect&body=Your%20website%20is%20Awesome!"),
          navigationItem(Icon(Feather.linkedin), "https://www.linkedin.com/in/toseef-khan/"),
          navigationItem(Icon(Feather.github), "https://github.com/toseefkhan403"),
        ],
      ),
    );
  }

  themeButton() => ValueListenableBuilder(
      valueListenable: AdaptiveTheme.of(context).modeChangeNotifier,
      builder: (BuildContext context, AdaptiveThemeMode value, Widget? child) {
        return IconButton(
            onPressed: () => value.isDark
                ? AdaptiveTheme.of(context).setLight()
                : AdaptiveTheme.of(context).setDark(),
            icon: Icon(
              value.isDark ? Feather.sun : Feather.moon,
              color: Theme.of(context).iconTheme.color,
            ));
      });

  navigationItem(Icon icon, String url) => IconButton(
        icon: icon,
        padding: const EdgeInsets.all(14),
        onPressed: () async {
          if (!await launchUrl(Uri.parse(url))) {
            throw Exception('Could not launch $url');
          }
        },
      );
}
