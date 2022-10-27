import 'package:flutter/material.dart';
import 'package:pokedex_app/models/pokemon_provider.dart';
import 'package:pokedex_app/screens/home/home.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PokemonProvider(),
      child: MaterialApp(
          title: 'Pokedex',
          theme: ThemeData(primarySwatch: Colors.blue, fontFamily: 'Poppins'),
          home: const Home()),
    );
  }
}
