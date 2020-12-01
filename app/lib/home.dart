import 'package:flutter/material.dart';
import 'drawer.dart';

class Home extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<Home> {
  var _textoInterativo = 'Formulario interagindo\ncom a tela';
  var _controllerTextoInterativo = TextEditingController();
  var _corBase = Colors.red;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        leading: Icon(Icons.person_rounded),
        title: Text("Essa é a AppBar"),
        centerTitle: true,
      ),
      endDrawer: MyDrawer(),
      body: Column(
        children: [
          Container(
            child: Align(
              alignment: Alignment.topCenter,
              child: Text(
                'Bem vindo ao meu tutorial',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 35,
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 20),
            child: Image(image: AssetImage('tutorial-image.png')),
          ),
          Container(
            margin: EdgeInsets.only(top: 25),
            child: Column(
              children: [
                Text(
                  'Aqui está uma lista\nde cards automaticas',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 25,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(2, (index) {
                    return Card(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          children: [
                            Text(
                              'Card $index',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w600),
                            ),
                            Image(
                              image: AssetImage(
                                'sample.jpg',
                              ),
                              height: 100,
                            ),
                            Row(
                              children: [
                                FlatButton(
                                    onPressed: null,
                                    child: Text(
                                      'Uma acao qualquer',
                                      style: TextStyle(color: Colors.black),
                                    )),
                                IconButton(
                                    icon: Icon(
                                      Icons.open_in_new,
                                      color: _corBase,
                                    ),
                                    onPressed: null)
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  }),
                ),
                Text(
                  'Aqui está uma lista\nde cards manual',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 25,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Card(
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            children: [
                              Text(
                                'Card 1',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w600),
                              ),
                              Image(
                                image: AssetImage(
                                  'sample.jpg',
                                ),
                                height: 100,
                              ),
                              Row(
                                children: [
                                  FlatButton(
                                      onPressed: null,
                                      child: Text(
                                        'Uma acao qualquer',
                                        style: TextStyle(color: Colors.black),
                                      )),
                                  IconButton(
                                      icon: Icon(
                                        Icons.open_in_new,
                                        color: _corBase,
                                      ),
                                      onPressed: null)
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      Card(
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            children: [
                              Text(
                                'Card 2',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w600),
                              ),
                              Image(
                                image: AssetImage(
                                  'sample.jpg',
                                ),
                                height: 100,
                              ),
                              Row(
                                children: [
                                  FlatButton(
                                      onPressed: null,
                                      child: Text(
                                        'Uma acao qualquer',
                                        style: TextStyle(color: Colors.black),
                                      )),
                                  IconButton(
                                      icon: Icon(
                                        Icons.open_in_new,
                                        color: _corBase,
                                      ),
                                      onPressed: null)
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                  child: Text(
                    _textoInterativo,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                ),
                Container(
                  width: 450,
                  child: TextField(
                    controller: _controllerTextoInterativo,
                    autocorrect: true,
                    style: TextStyle(),
                    onChanged: (text) {
                      setState(() {
                        _textoInterativo = text;
                      });
                    },
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          setState(() {
                            _textoInterativo =
                                'Formulario interagindo\ncom a tela';
                            _controllerTextoInterativo.text = '';
                          });
                        },
                      ),
                      border: OutlineInputBorder(),
                      labelText: 'Digite algo',
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
