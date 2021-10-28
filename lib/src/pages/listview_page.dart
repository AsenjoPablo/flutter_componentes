import 'dart:async';

import 'package:flutter/material.dart';

class ListviewPage extends StatefulWidget {
  ListviewPage({Key? key}) : super(key: key);

  @override
  _ListviewPageState createState() => _ListviewPageState();
}

class _ListviewPageState extends State<ListviewPage> {
  final ScrollController _scrollController = ScrollController();

  final List<int> _listaNumeros = [];
  int _ultimoItem = 0;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _agregarImagenes();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        /* _agregarImagenes(); */
        fetchData();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Listview'),
      ),
      body: Stack(children: [
        _crearList(),
        _crearLoading(),
      ]),
    );
  }

  Widget _crearList() {
    return RefreshIndicator(
      onRefresh: _obtenerPaginaInicial,
      child: ListView.builder(
        controller: _scrollController,
        itemCount: _listaNumeros.length,
        itemBuilder: (BuildContext context, int index) {
          final imagen = _listaNumeros[index];
          return FadeInImage(
              placeholder: const AssetImage('assets/jar-loading.gif'),
              image: NetworkImage('https://picsum.photos/400/?image=$imagen'));
        },
      ),
    );
  }

  Future<void> _obtenerPaginaInicial() async {
    const duration = Duration(seconds: 2);

    Timer(duration, () {
      _listaNumeros.clear();
      _ultimoItem++;
      _agregarImagenes();
    });

    return Future.delayed(duration);
  }

  void _agregarImagenes() {
    for (var i = 0; i < 10; i++) {
      _ultimoItem++;
      _listaNumeros.add(_ultimoItem);
    }

    setState(() {});
  }

  Future<void> fetchData() async {
    setState(() {
      _isLoading = true;
    });

    const duration = Duration(seconds: 1);
    Timer(duration,
        respuestaHTTP); // sin parentesis para no lanzarla al instante, solo referenciar
  }

  void respuestaHTTP() {
    _agregarImagenes();
    setState(() {
      _isLoading = false;
    });

    _scrollController.animateTo(_scrollController.position.pixels + 300,
        duration: const Duration(milliseconds: 200),
        curve: Curves.fastOutSlowIn);
  }

  Widget _crearLoading() {
    if (_isLoading) {
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const <Widget>[
              CircularProgressIndicator(
                color: Colors.white,
                strokeWidth: 8.0,
              ),
            ],
          ),
        ],
      );
    } else {
      return Container();
    }
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController
        .dispose(); // evitar gasto de memoria innecesario creando multiples controllers
  }
}
