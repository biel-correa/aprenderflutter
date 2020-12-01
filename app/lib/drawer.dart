import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          ListTile(
            title: Text('Home'),
            onTap: () {
              Navigator.of(context).pushNamed('/');
            },
          ),
          ListTile(
            title: Text('Pagina que rola'),
            onTap: () {
              Navigator.of(context).pushNamed('/paginaRolar');
            },
          ),
          ListTile(
            title: Text('Adicionar Itens'),
            onTap: () {
              Navigator.of(context).pushNamed('/adicionarItens');
            },
          ),
          ListTile(
            title: Text('Navegar com valores'),
            onTap: () {
              Navigator.of(context).pushNamed('/navComValor');
            },
          ),
          ListTile(
            title: Text('Estudo de APIs'),
            onTap: () {
              Navigator.of(context).pushNamed('/apiDinheiro');
            },
          ),
          ListTile(
            title: Text('Conversor de Moeda'),
            onTap: () {
              Navigator.of(context).pushNamed('/conversorMoeda');
            },
          ),
        ],
      ),
    );
  }
}
