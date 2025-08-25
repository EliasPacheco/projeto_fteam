# Rick and Morty App

Uma aplicação mobile desenvolvida em Flutter que consome a API do Rick and Morty para exibir informações sobre os personagens da série.

## 🚀 Funcionalidades

- **Listagem de Personagens**: Exibe uma lista paginada de todos os personagens com suas imagens e informações básicas
- **Busca de Personagens**: Barra de pesquisa para filtrar personagens por nome em tempo real
- **Detalhes do Personagem**: Ao clicar em um personagem, exibe uma página detalhada com:
  - Nome do personagem
  - Status (Vivo, Morto, Desconhecido)
  - Espécie
  - Tipo
  - Gênero
  - ID do personagem
- **Pull to Refresh**: Atualiza a lista de personagens
- **Scroll Infinito**: Carrega mais personagens automaticamente ao rolar
- **Paginação Otimizada**: Carregamento eficiente de dados com indicadores visuais
- **Cache de Imagens**: As imagens são cacheadas para melhor performance

## 🏗️ Arquitetura

O projeto segue a arquitetura **MVVM (Model-View-ViewModel)**:

### 📁 Estrutura de Pastas

```
lib/
├── models/           # Modelos de dados
│   ├── character.dart
│   └── api_response.dart
├── services/         # Serviços de API
│   └── api_service.dart
├── viewmodels/       # ViewModels (lógica de negócio)
│   └── characters_viewmodel.dart
├── views/           # Telas da aplicação
│   ├── characters_list_view.dart
│   └── character_detail_view.dart
└── main.dart        # Ponto de entrada da aplicação
```

### 🔧 Tecnologias Utilizadas

- **Flutter**: Framework de desenvolvimento mobile
- **Provider**: Gerenciamento de estado
- **HTTP**: Cliente HTTP para consumir a API
- **Cached Network Image**: Cache de imagens

## 📱 Telas

### Lista de Personagens
- Exibe cards com imagem, nome, status e espécie de cada personagem
- Barra de pesquisa para filtrar personagens por nome
- Indicador visual de status (verde para vivo, vermelho para morto, cinza para desconhecido)
- Pull to refresh para atualizar a lista
- Scroll infinito para carregar mais personagens
- Paginação otimizada com indicadores de loading

### Detalhes do Personagem
- Imagem em destaque com efeito Hero
- Informações completas do personagem organizadas em cards
- Design responsivo e moderno

## 🎨 Design

- **Tema**: Cores baseadas na série Rick and Morty (verde)
- **Material Design 3**: Interface moderna e intuitiva
- **Responsivo**: Adapta-se a diferentes tamanhos de tela
- **Animações**: Transições suaves entre telas

## 🚀 Como Executar

1. **Instalar dependências**:
   ```bash
   flutter pub get
   ```

2. **Executar a aplicação**:
   ```bash
   flutter run
   ```

## 📋 Requisitos

- Flutter SDK 3.9.0 ou superior
- Dart SDK
- Dispositivo Android/iOS ou emulador

## 🔗 API

A aplicação consome a [Rick and Morty API](https://rickandmortyapi.com/):
- **Endpoint**: `https://rickandmortyapi.com/api/character`
- **Documentação**: https://rickandmortyapi.com/documentation

## 📝 Critérios de Avaliação Atendidos

✅ **Código legível e organizado**: Estrutura clara com separação de responsabilidades
✅ **Arquitetura MVVM**: Implementação completa do padrão Model-View-ViewModel
✅ **Boa usabilidade**: Interface intuitiva com feedback visual
✅ **Responsividade**: Adaptação a diferentes tamanhos de tela
✅ **Boas práticas**: Código limpo, documentado e seguindo padrões do Flutter

## 🎯 Funcionalidades Implementadas

- ✅ Consumo da API Rick and Morty
- ✅ Listagem de personagens com imagens
- ✅ Busca e filtragem por nome
- ✅ Página de detalhes com informações completas
- ✅ Paginação infinita otimizada
- ✅ Tratamento de erros
- ✅ Loading states
- ✅ Cache de imagens
- ✅ Pull to refresh
