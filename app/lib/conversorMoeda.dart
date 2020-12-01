import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'drawer.dart';

class ConversorMoeda extends StatefulWidget {
  @override
  _ConversorMoedaState createState() => _ConversorMoedaState();
}

class _ConversorMoedaState extends State<ConversorMoeda> {
  getData(location) async {
    Response rawData =
        await get('https://api.exchangeratesapi.io/latest?base=$location');

    Map dataConverted = jsonDecode(rawData.body);
    setState(() {
      data = dataConverted;
    });
  }

  var data;
  var valorAConverter = TextEditingController();
  var valorConvertido = TextEditingController();
  var coin = 'USD';
  var selector = 'BRL';
  var value = 0.0;
  var allCoins = [
    "USD",
    "BRL",
    "CAD",
    "HKD",
    "ISK",
    "PHP",
    "DKK",
    "HUF",
    "CZK",
    "GBP",
    "RON",
    "SEK",
    "IDR",
    "INR",
    "RUB",
    "HRK",
    "JPY",
    "THB",
    "CHF",
    "EUR",
    "MYR",
    "BGN",
    "TRY",
    "NOK",
    "NZD",
    "ZAR",
    "AUD",
    "ILS",
    "KRW",
    "PLN"
  ];

  calcValue(double newValue, double coinValue) {
    setState(() {
      value = double.parse((newValue * coinValue).toStringAsFixed(2));
    });
    print(value * coinValue);
  }

  @override
  initState() {
    super.initState();
    getData(selector);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          leading: Icon(Icons.person_rounded),
          title: Text("Conversor de Moeda"),
          centerTitle: true,
        ),
        endDrawer: MyDrawer(),
        body: SafeArea(
            child: Container(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(8, 15, 8, 15),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(bottom: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        DropdownButton<String>(
                          value: selector,
                          icon: Icon(Icons.arrow_drop_down),
                          onChanged: (String value) {
                            setState(() {
                              selector = value;
                              getData(selector);
                            });
                          },
                          items: allCoins.map((value) {
                            return DropdownMenuItem(
                              child: Text(value),
                              value: value,
                            );
                          }).toList(),
                        ),
                        IconButton(
                            icon: Icon(Icons.autorenew),
                            onPressed: () {
                              setState(() {
                                var holder = coin;
                                coin = selector;
                                selector = holder;
                                getData(selector);
                                if (valorAConverter.text != '') {
                                  calcValue(double.parse(valorAConverter.text),
                                      data['rates'][selector]);
                                }
                              });
                            }),
                        DropdownButton<String>(
                          value: coin,
                          icon: Icon(Icons.arrow_drop_down),
                          onChanged: (String value) {
                            setState(() {
                              coin = value;
                            });
                          },
                          items: allCoins.map((value) {
                            return DropdownMenuItem(
                              child: Text(value),
                              value: value,
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: TextField(
                      controller: valorAConverter,
                      keyboardType:
                          TextInputType.numberWithOptions(decimal: true),
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      decoration: InputDecoration(
                        hintText: 'Valor',
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (text) {
                        calcValue(double.parse(text), data['rates'][coin]);
                      },
                    ),
                  ),
                  Center(
                    child: Text(
                      '$value',
                      style: TextStyle(
                          fontSize:
                              10 * (MediaQuery.of(context).size.width * 0.015)),
                    ),
                  )
                ],
              ),
            ),
          ),
        )));
  }
}
