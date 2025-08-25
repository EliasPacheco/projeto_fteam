import 'package:flutter/foundation.dart';
import '../models/character.dart';
import '../services/api_service.dart';

class CharactersViewModel extends ChangeNotifier {
  final ApiService _apiService = ApiService();
  
  List<Character> _characters = [];
  List<Character> _filteredCharacters = [];
  Character? _selectedCharacter;
  bool _isLoading = false;
  String? _error;
  int _currentPage = 1;
  bool _hasNextPage = true;
  String _searchQuery = '';

  // Getters
  List<Character> get characters => _characters;
  List<Character> get filteredCharacters => _filteredCharacters;
  Character? get selectedCharacter => _selectedCharacter;
  bool get isLoading => _isLoading;
  String? get error => _error;
  bool get hasNextPage => _hasNextPage;
  String get searchQuery => _searchQuery;

  // Carregar personagens
  Future<void> loadCharacters({bool refresh = false}) async {
    if (refresh) {
      _currentPage = 1;
      _characters.clear();
      _hasNextPage = true;
    }

    if (_isLoading || !_hasNextPage) return;

    _setLoading(true);
    _clearError();

    try {
      final response = await _apiService.getCharacters(page: _currentPage);
      
      if (refresh) {
        _characters = response.results;
      } else {
        _characters.addAll(response.results);
      }
      
      _hasNextPage = response.info.next != null;
      _currentPage++;
      
      // Aplicar filtro após carregar novos dados
      _applySearchFilter();
      
    } catch (e) {
      _setError(e.toString());
    } finally {
      _setLoading(false);
    }
  }

  // Carregar detalhes de um personagem
  Future<void> loadCharacterDetails(int characterId) async {
    _setLoading(true);
    _clearError();

    try {
      _selectedCharacter = await _apiService.getCharacterById(characterId);
    } catch (e) {
      _setError(e.toString());
    } finally {
      _setLoading(false);
    }
  }

  // Selecionar personagem
  void selectCharacter(Character character) {
    _selectedCharacter = character;
    notifyListeners();
  }

  // Limpar personagem selecionado
  void clearSelectedCharacter() {
    _selectedCharacter = null;
    notifyListeners();
  }

  // Buscar personagens
  void searchCharacters(String query) {
    _searchQuery = query.toLowerCase().trim();
    _applySearchFilter();
  }

  // Limpar busca
  void clearSearch() {
    _searchQuery = '';
    _applySearchFilter();
  }

  // Aplicar filtro de busca
  void _applySearchFilter() {
    if (_searchQuery.isEmpty) {
      _filteredCharacters = List.from(_characters);
    } else {
      _filteredCharacters = _characters.where((character) {
        return character.name.toLowerCase().contains(_searchQuery);
      }).toList();
    }
    notifyListeners();
  }

  // Métodos privados para gerenciar estado
  void _setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

  void _setError(String error) {
    _error = error;
    notifyListeners();
  }

  void _clearError() {
    _error = null;
    notifyListeners();
  }
}
