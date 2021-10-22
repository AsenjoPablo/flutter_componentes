import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget {
  HomePageTemp({Key? key}) : super(key: key);

  final opciones = ['Uno', 'Dos', 'Tres', 'Cuatro', 'Cinco'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Componentes Temp'),
      ),
      body: ListView(
        children: _crearItemsCorto(),
      ),
    );
  }

  /* List<Widget> _crearItems() {
    List<Widget> lista = [];

    for (var opcion in opciones) {
      final tempWidget = ListTile(
        title: Text(opcion),
      );

      //con ..add podemos volver a llamar al original, en lugar de repetir lista.add
      lista
        ..add(tempWidget)
        ..add(Divider());
    }

    return lista;
  } */

  List<Widget> _crearItemsCorto() {
    return opciones.map((item) {
      return Column(
        children: [
          ListTile(
            title: Text(item),
            subtitle: const Text('Un subtitulo'),
            leading: const Icon(Icons.dinner_dining_outlined),
            trailing: const Icon(Icons.arrow_right_rounded),
            onTap: () {},
          ),
          const Divider(),
        ],
      );
    }).toList();
  }
}
