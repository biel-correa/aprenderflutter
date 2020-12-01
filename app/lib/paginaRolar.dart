import 'package:flutter/material.dart';
import './drawer.dart';

class PaginaRolar extends StatefulWidget {
  @override
  _PaginaRolarState createState() => _PaginaRolarState();
}

class _PaginaRolarState extends State<PaginaRolar> {
  // var _corBase = Colors.red;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          leading: Icon(Icons.person_rounded),
          title: Text("Pagina que rola"),
          centerTitle: true,
        ),
        endDrawer: MyDrawer(),
        body: ListView(
            children: List.generate(20, (index) {
          return Card(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 15, 10, 15),
              child: Column(
                children: [
                  Text(
                    'titulo do card',
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                      ' Where does it come from? Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.The standard chunk of Lorem Ipsum used sinc')
                ],
              ),
            ),
          );
        })));
  }
}
