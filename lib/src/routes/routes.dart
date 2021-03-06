import 'package:flutter/material.dart';

import 'package:flutter_componentes/src/pages/alert_page.dart';
import 'package:flutter_componentes/src/pages/animated_container_page.dart';
import 'package:flutter_componentes/src/pages/avatar_page.dart';
import 'package:flutter_componentes/src/pages/card_page.dart';
import 'package:flutter_componentes/src/pages/home_page.dart';
import 'package:flutter_componentes/src/pages/input_page.dart';
import 'package:flutter_componentes/src/pages/listview_page.dart';
import 'package:flutter_componentes/src/pages/sliders_page.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    '/': (BuildContext context) => const HomePage(),
    'alert': (BuildContext context) => const AlertPage(),
    AvatarPage.pageName: (BuildContext context) => const AvatarPage(),
    'card': (BuildContext context) => const CardPage(),
    'animatedContainer': (BuildContext context) => AnimatedContainerPage(),
    'input': (BuildContext context) => InputPage(),
    'sliders': (BuildContext context) => SlidersPage(),
    'listview': (BuildContext context) => ListviewPage(),
  };
}
