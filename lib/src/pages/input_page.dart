import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  InputPage({Key? key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String _nombre = '';
  String _email = '';
  String _fecha = '';

  String _poderSeleccionado = 'Volar';

  List <String> _poderes = ['Volar', 'Rayos X', 'Super fuerza', 'Velocidad'];

  TextEditingController _inputFieldDateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inputs de texto'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
        children: <Widget>[
          _crearInput(),
          const Divider(),
          _crearEmail(),
          const Divider(),
          _crearPassword(),
          const Divider(),
          _crearFecha(context),
          const Divider(),
          _crearDropdown(),
          const Divider(),
          _crearPersona(),
        ],
      ),
    );
  }

  Widget _crearInput() {
    return TextField(
        autofocus: true,
        textCapitalization: TextCapitalization.sentences,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          counter: Text('Letras: ${_nombre.length}'),
          hintText: 'Nombre de la persona',
          labelText: 'Nombre',
          helperText: 'Este es un helper text',
          suffixIcon: const Icon(Icons.accessibility),
          icon: const Icon(Icons.account_circle),
        ),
        onChanged: (valor) {
          setState(() {
            _nombre = valor;
          });
        });
  }

  Widget _crearPersona() {
    return ListTile(
      title: Text('Nombre es: $_nombre'),
      subtitle: Text('El email es: $_email'),
      trailing: Text('$_poderSeleccionado'),
    );
  }

  Widget _crearEmail() {
    return TextField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          hintText: 'Email',
          labelText: 'Email',
          suffixIcon: const Icon(Icons.alternate_email),
          icon: const Icon(Icons.email),
        ),
        onChanged: (valor) {
          setState(() {
            _email = valor;
          });
        });
  }

  _crearPassword() {
    return TextField(
        obscureText: true,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          hintText: 'Contraseña',
          labelText: 'Contraseña',
          suffixIcon: const Icon(Icons.lock_outline),
          icon: const Icon(Icons.lock),
        ),
        onChanged: (valor) {
          setState(() {
            _email = valor;
          });
        });
  }

  _crearFecha(BuildContext context) {
    return TextField(
      enableInteractiveSelection: false, // para que no se pueda copiar pegar
      controller: _inputFieldDateController,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        hintText: 'Fecha de nacimiento',
        labelText: 'Fecha de nacimiento',
        suffixIcon: const Icon(Icons.calendar_today),
        icon: const Icon(Icons.calendar_today_outlined),
      ),
      onTap: () {
        FocusScope.of(context).requestFocus(
            FocusNode()); // esto quita el foco del elemento para lanzar nuestra función en su lugar

        _selectDate(context);
      },
    );
  }

  void _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2015),
        lastDate: DateTime(2025)
        locale: const Locale('es', 'ES'),
        );

    if (picked != null) {
      setState(() {
        _fecha = picked.toString();
        _inputFieldDateController.text = _fecha;
      });
    }
  }

  List <DropdownMenuItem<String>> _getOpcionesDropdown () {
    List <DropdownMenuItem<String>> lista = [];

    _poderes.forEach((element) {
      lista.add(DropdownMenuItem(child: Text(element), value: element));
    });

    return lista;
  }

  Widget _crearDropdown() {

    return Row(
      children: [
        Icon(Icons.select_all),
        SizedBox(width: 30.0,),
        DropdownButton<String>(value: _poderSeleccionado, items: _getOpcionesDropdown(), onChanged: (String? opcion){
          setState(() {
            _poderSeleccionado = opcion!;
          });
        }),
      ],
    );
  }
}
