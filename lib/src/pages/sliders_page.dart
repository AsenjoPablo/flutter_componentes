import 'package:flutter/material.dart';

class SlidersPage extends StatefulWidget {
  SlidersPage({Key? key}) : super(key: key);

  @override
  _SlidersPageState createState() => _SlidersPageState();
}

class _SlidersPageState extends State<SlidersPage> {
  double _valorSlider = 0;
  bool _estaBloqueadaImagen = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sliders')),
      body: Container(
        padding: EdgeInsets.only(top: 50.0),
        child: Column(
          children: <Widget>[
            Text('${_valorSlider.floor()}'),
            _crearSlider(),
            _crearCheckbox(),
            _crearSwitch(),
            Expanded(child: _crearImagen()),
          ],
        ),
      ),
    );
  }

  Widget _crearSlider() {
    return Slider(
      activeColor: Colors.indigoAccent,
      label: 'Tamaño de la imagen',
      /* divisions: 10, */
      onChanged: _estaBloqueadaImagen
          ? null
          : (double newValue) {
              setState(() {
                _valorSlider = newValue;
              });
            },
      value: _valorSlider,
      min: 0,
      max: 300,
    );
  }

  Widget _crearCheckbox() {
    /* return Checkbox(
        value: _estaBloqueadaImagen,
        onChanged: (value) {
          setState(() {
            _estaBloqueadaImagen = value ?? false;
          });
        }); */

    return CheckboxListTile(
        title: Text('Bloquear imagen'),
        value: _estaBloqueadaImagen,
        onChanged: (value) {
          setState(() {
            _estaBloqueadaImagen = value ?? false;
          });
        });
  }

  Widget _crearSwitch() {
    return SwitchListTile(
        title: Text('Bloquear imagen'),
        value: _estaBloqueadaImagen,
        onChanged: (value) {
          setState(() {
            _estaBloqueadaImagen = value;
          });
        });
  }

  Widget _crearImagen() {
    return Image(
        fit: BoxFit.contain,
        width: _valorSlider,
        height: _valorSlider,
        image: const NetworkImage(
            'https://i1.wp.com/hipertextual.com/wp-content/uploads/2020/08/hipertextual-puedes-ver-primer-trailer-the-batman-4k-2020956533-scaled.jpg?fit=2560%2C1714&ssl=1'));
  }
}
