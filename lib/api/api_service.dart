import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/vertex.dart';

class ApiService {
  ApiService();

  Future<List<VertexDto>> fetchData() async {
    var url = Uri.parse('https://flutter.webspark.dev/flutter/api');
    final response = await http.get(
      url,
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final vertexesList = data['data'];
      final vertexes = <VertexDto>[];
      for (var el in vertexesList) {
        final vertex = VertexDto.fromJson(el);
        vertexes.add(vertex);
      }
      return vertexes;
    }
    return [];
  }
}
