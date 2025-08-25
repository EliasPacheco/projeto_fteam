import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'viewmodels/characters_viewmodel.dart';
import 'views/characters_list_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CharactersViewModel(),
      child: MaterialApp(
        title: 'Rick and Morty App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.green,
            brightness: Brightness.light,
          ),
          useMaterial3: true,
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.green[800],
            foregroundColor: Colors.white,
            elevation: 0,
          ),
          cardTheme: const CardThemeData(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(12)),
            ),
          ),
        ),
        home: const CharactersListView(),
      ),
    );
  }
}
