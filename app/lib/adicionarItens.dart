import 'package:flutter/material.dart';

import 'drawer.dart';

class AdicionarItens extends StatefulWidget {
  @override
  _AdicionarItensState createState() => _AdicionarItensState();
}

class _AdicionarItensState extends State<AdicionarItens> {
  var itens = [];
  var tituloDiferenciado = TextEditingController();
  bool erro = false;
  var textoAntigo = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.plus_one),
            onPressed: () {
              var index = itens.length;
              setState(() {
                itens.add('Item $index');
              });
            }),
        title: Text("Adicionar Itens"),
        centerTitle: true,
      ),
      endDrawer: MyDrawer(),
      body: ListView(
          children: [
                Card(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
                    child: TextField(
                      cursorColor: Colors.black,
                      controller: tituloDiferenciado,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          errorText: erro ? 'Não pode ser vazio' : null,
                          hintText: 'Digite o título do proximo item',
                          suffixIcon: IconButton(
                            icon: Icon(Icons.add),
                            onPressed: () {
                              print(erro);
                              if (tituloDiferenciado.text.length < 1) {
                                setState(() {
                                  erro = true;
                                });
                                print(erro);
                              } else {
                                setState(() {
                                  erro = false;
                                  itens.insert(
                                      itens.length, tituloDiferenciado.text);
                                  tituloDiferenciado.clear();
                                });
                              }
                              print(tituloDiferenciado.text);
                            },
                          )),
                    ),
                  ),
                ),
              ] +
              List.generate(itens.length, (index) {
                return Card(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
                    child: Text(itens[index]),
                  ),
                );
              })),
    );
  }
}
