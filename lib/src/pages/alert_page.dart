import 'package:flutter/material.dart';

class AlertPage extends StatelessWidget {
  const AlertPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Alert Page'),
      ),
      body: Center(
        child: ElevatedButton(
            child: const Text('Mostrar alerta'),
            onPressed: () => _mostrarAlerta(context),
            style: ElevatedButton.styleFrom(
                primary: Colors.yellow[800], shape: const StadiumBorder())),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }

  void _mostrarAlerta(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40.0)),
              title: const Text('Título de la alerta'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: const <Widget>[
                  Text('Este es el contenido del a caja de la alerta'),
                  SizedBox(
                    height: 30.0,
                  ),
                  FlutterLogo(
                    size: 100,
                  ),
                ],
              ),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('Cancelar'),
                ),
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('OK'),
                ),
              ]);
        },
        barrierDismissible: true,
        barrierColor: Colors.blue[800]);
  }
}
