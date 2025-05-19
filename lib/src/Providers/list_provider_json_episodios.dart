import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

class ListProviderEpisodiosJson {
  List<dynamic> list = [];

  Future<List<dynamic>> cargarEpisodios() async {
    final datos = await rootBundle.loadString('data/southpark_episodios.json');
    final decoded = json.decode(datos);
    list = decoded['capitulos']; 
    return list;
  }
}

final listProviderEpisodiosJson = ListProviderEpisodiosJson();
