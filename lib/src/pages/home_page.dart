import 'package:flutter/material.dart';
import 'package:flutter_componentes/src/pages/alert_page.dart';
import 'package:flutter_componentes/src/providers/menu_provider.dart';
import 'package:flutter_componentes/src/utils/icono_string_util.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Componentes'),
      ),
      body: _lista(),
    );
  }

  Widget _lista() {
    // menuProvider.cargarData();

    /* return FutureBuilder(
      future: menuProvider.cargarData(),
      initialData: [],
      builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
        return ListView(
          children: _listaItems(snapshot.data),
        );
      },
    ); */

    return FutureBuilder(
      future: menuProvider.cargarData(),
      initialData: [],
      builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
        return ListView(
          children: _listaItems(snapshot.data ?? [], context),
        );
      },
    );
  }

  List<Widget> _listaItems(List<dynamic> data, BuildContext context) {
    final List<Widget> opciones = [];

    for (var element in data) {
      final widgetTemp = ListTile(
        title: Text(element['texto']),
        leading: getIcon(element['icon']),
        trailing: const Icon(Icons.keyboard_arrow_right, color: Colors.blue),
        onTap: () {
          // esto sería muy hardcodeado con un switch o parecidos, y no es lo que buscamos
          /* final route =
              MaterialPageRoute(builder: (context) => const AlertPage());
          Navigator.push(context, route); */

          // la ruta que pusheamos DEBE estar definida en main.dart
          Navigator.pushNamed(context, element['ruta']);
        },
      );

      opciones
        ..add(widgetTemp)
        ..add(const Divider());
    }

    return opciones;
  }
}
