import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

class ListProviderJson {
  List<dynamic> list = [];

  Future<List<dynamic>> cargarDatos() async {
    final datos = await rootBundle.loadString('data/southpark.json');
    final decoded = json.decode(datos);
    list = decoded['characters']; 
    return list;
  }
}

final listProviderJson = ListProviderJson();
