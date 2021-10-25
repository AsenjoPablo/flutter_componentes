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
          const SizedBox(
            height: 30.0,
          ),
          _cardTipo1(),
          const SizedBox(
            height: 30.0,
          ),
          _cardTipo2(),
          const SizedBox(
            height: 30.0,
          ),
          _cardTipo1(),
          const SizedBox(
            height: 30.0,
          ),
          _cardTipo2(),
          const SizedBox(
            height: 30.0,
          ),
        ],
      ),
    );
  }

  Widget _cardTipo1() {
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
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
    final card = Container(
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

    // se crea un container en lugar de retornar directamente la Card para poder moldearla y evitar que la imagen no respete los border radius de la tarjeta
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.0),
        boxShadow: const <BoxShadow>[
          BoxShadow(
              color: Colors.black26, blurRadius: 6.0, offset: Offset(0.0, 4.0))
        ],
      ),
      // ClipRRect recorta lo que esté por fuera
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: card,
      ),
    );
  }
}
