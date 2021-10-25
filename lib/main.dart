import 'package:flutter/material.dart';

import 'package:flutter_componentes/src/pages/alert_page.dart';
import 'package:flutter_componentes/src/routes/routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      //home: HomePage(),
      initialRoute: '/',
      // si son pocas rutas, podemos incluirlas aquí
      routes: getApplicationRoutes(),
      // si la ruta no está definida en 'routes', esta función retorna la que decidamos
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(builder: (context) => const AlertPage());
      },
    );
  }
}
