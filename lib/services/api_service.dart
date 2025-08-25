import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/api_response.dart';
import '../models/character.dart';

class ApiService {
  static const String baseUrl = 'https://rickandmortyapi.com/api';

  Future<ApiResponse> getCharacters({int page = 1}) async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/character?page=$page'),
      );

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        return ApiResponse.fromJson(jsonData);
      } else {
        throw Exception('Falha ao carregar personagens: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Erro de conexão: $e');
    }
  }

  Future<Character> getCharacterById(int id) async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/character/$id'),
      );

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        return Character.fromJson(jsonData);
      } else {
        throw Exception('Falha ao carregar personagem: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Erro de conexão: $e');
    }
  }
}
