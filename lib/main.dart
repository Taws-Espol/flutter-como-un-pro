import 'package:flutter/material.dart';
import 'package:flutter_como_un_pro/components/components.dart';
import 'package:flutter_como_un_pro/utils/pokemon_utils.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      showSemanticsDebugger: true,
      title: 'Pokedex App',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red[800],
          title: const Text(
            "Pokedex",
            style: TextStyle(
              fontFamily: 'Pokemon-Solid',
              color: Colors.white,
              fontSize: 30,
            ),
          ),
        ),
        body: const _HomePageBody(),
      ),
    );
  }
}

class _HomePageBody extends StatelessWidget {
  const _HomePageBody();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Center(
          child: Column(
            children: pokemonList.map(
              (pokemon) {
                return PokemonCard(pokemon: pokemon);
              },
            ).toList(),
          ),
        ),
      ),
    );
  }
}
