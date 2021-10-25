import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  const CardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cards'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
        children: <Widget>[
          _cardTipo1(),
          const SizedBox(
            height: 30.0,
          ),
          _cardTipo2(),
        ],
      ),
    );
  }

  Widget _cardTipo1() {
    return Card(
      child: Column(children: <Widget>[
        const ListTile(
          title: Text('Soy un título'),
          subtitle: Text(
              'Soy el contenido de la tarjeta que se está mostrando actualmente'),
          leading: Icon(Icons.photo_album),
        ),
        Row(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
          TextButton(onPressed: () {}, child: const Text('Cancelar')),
          TextButton(onPressed: () {}, child: const Text('OK')),
        ]),
      ]),
    );
  }

  _cardTipo2() {
    return Card(
      child: Column(
        children: [
          // esta imagen primero no aparece y luego sale de golpe, queremos suavizarlo
          /* Image(
              image: NetworkImage(
                  'https://thelandscapephotoguy.com/wp-content/uploads/2019/01/landscape%20new%20zealand%20S-shape.jpg')), */
          const FadeInImage(
            placeholder: AssetImage('assets/jar-loading.gif'),
            image: NetworkImage(
                'https://thelandscapephotoguy.com/wp-content/uploads/2019/01/landscape%20new%20zealand%20S-shape.jpg'),
            fadeInDuration: Duration(milliseconds: 200),
            height: 300.0,
            fit: BoxFit.cover,
          ),
          Container(
            padding: const EdgeInsets.all(10.0),
            child: const Text('Esto es un texto'),
          )
        ],
      ),
    );
  }
}
