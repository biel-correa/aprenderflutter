import 'package:estudosWidgets/conversorMoeda.dart';
import 'package:flutter/material.dart';
import 'package:estudosWidgets/apiEstudo.dart';
import './paginaRolar.dart';
import './home.dart';
import 'adicionarItens.dart';
import 'navegarComValor.dart';

class RouteGenerator {
  // ignore: missing_return
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // ignore: unused_local_variable
    final args = settings.arguments;
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => Home());
        break;
      case '/paginaRolar':
        return MaterialPageRoute(builder: (_) => PaginaRolar());
        break;
      case '/adicionarItens':
        return MaterialPageRoute(builder: (_) => AdicionarItens());
        break;
      case '/navComValor':
        return MaterialPageRoute(builder: (_) => NavComValor());
        break;
      case '/navRecebeValor':
        return MaterialPageRoute(
            builder: (_) => NavRecebeValor(
                  data: args,
                ));
        break;
      case '/apiDinheiro':
        return MaterialPageRoute(builder: (_) => ApiDinheiro());
        break;
      case '/conversorMoeda':
        return MaterialPageRoute(builder: (_) => ConversorMoeda());
        break;

      default:
    }
  }
}
