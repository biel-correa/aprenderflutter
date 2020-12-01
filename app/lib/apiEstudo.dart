import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'drawer.dart';

class User {
  int userId;
  int id;
  String title;
  bool completed;

  saveData(Map json) {
    this.userId = json['userId'];
    this.id = json['id'];
    this.title = json['title'];
    this.completed = json['completed'];
  }
}

class ApiDinheiro extends StatefulWidget {
  @override
  _ApiDinheiroState createState() => _ApiDinheiroState();
}

class _ApiDinheiroState extends State<ApiDinheiro> {
  User userData = User();
  getData() async {
    Response rawData =
        await get('https://jsonplaceholder.typicode.com/todos/1');

    Map data = jsonDecode(rawData.body);
    setState(() {
      userData.saveData(data);
    });
    print(userData);
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        leading: Icon(Icons.person_rounded),
        title: Text("Estudo de APIs"),
        centerTitle: true,
      ),
      endDrawer: MyDrawer(),
      body: SafeArea(
        child: Container(
          child: ListView(scrollDirection: Axis.horizontal, children: [
            DataTable(
              columns: [
                DataColumn(label: Text('User Id')),
                DataColumn(label: Text('Id')),
                DataColumn(label: Text('Title')),
                DataColumn(label: Text('Complete')),
              ],
              rows: [
                DataRow(cells: [
                  DataCell(Text('${userData.userId}')),
                  DataCell(Text('${userData.id}')),
                  DataCell(Text('${userData.title}')),
                  DataCell(Text('${userData.completed}')),
                ])
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
