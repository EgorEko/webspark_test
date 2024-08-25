import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/vertex.dart';

class ApiService {
  ApiService();

  Future<List<VertexDto>> fetchData(String path) async {
    var url = Uri.parse(path);
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

  Future<MessageDto> send(List<dynamic> resultList) async {
    var url = Uri.parse('https://flutter.webspark.dev/flutter/api');
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: json.encoder.convert(resultList),
    );

    if (response.statusCode == 200) {
      return MessageDto.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to post data.');
    }
  }
}
