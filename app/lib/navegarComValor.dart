import 'package:flutter/material.dart';

import 'drawer.dart';

class NavComValor extends StatefulWidget {
  @override
  _NavComValorState createState() => _NavComValorState();
}

class _NavComValorState extends State<NavComValor> {
  var dataController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          leading: Icon(Icons.person_rounded),
          title: Text("Navegação com valor"),
          centerTitle: true,
        ),
        endDrawer: MyDrawer(),
        body: Column(
          children: [
            Card(
              child: Padding(
                padding: EdgeInsets.all(10),
                child: TextField(
                  controller: dataController,
                  decoration: InputDecoration(
                      suffixIcon: IconButton(
                          icon: Icon(Icons.send),
                          onPressed: () {
                            print(dataController.text);
                            Navigator.of(context).pushNamed('/navRecebeValor',
                                arguments: dataController.text);
                          }),
                      border: OutlineInputBorder(),
                      hintText: 'Insira a informação que será passada'),
                ),
              ),
            )
          ],
        ));
  }
}

class NavRecebeValor extends StatefulWidget {
  final String data;
  NavRecebeValor({Key key, this.data}) : super(key: key);

  @override
  _NavRecebeValorState createState() => _NavRecebeValorState();
}

class _NavRecebeValorState extends State<NavRecebeValor> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pushNamed('/navComValor');
            },
          ),
          title: Text("Recebe os valores"),
          centerTitle: true,
        ),
        endDrawer: MyDrawer(),
        body: Center(
            child: ListView(
          children: [
            Text(
              "${widget.data}",
              style: TextStyle(fontSize: 50),
            ),
          ],
        )));
  }
}
