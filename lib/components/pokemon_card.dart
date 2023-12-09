import 'package:flutter/material.dart';
import 'package:flutter_como_un_pro/model/pokemon.dart';

class PokemonCard extends StatelessWidget {
  final Pokemon pokemon;
  const PokemonCard({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    const height = 350.0;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Container(
        height: height,
        decoration: BoxDecoration(
          color: Colors.purple[100],
          borderRadius: BorderRadius.circular(15),
        ),
        child: _PokemonCardBody(height: height, pokemon: pokemon),
      ),
    );
  }
}

class _PokemonCardBody extends StatefulWidget {
  const _PokemonCardBody({
    required this.height,
    required this.pokemon,
  });

  final double height;
  final Pokemon pokemon;

  @override
  State<_PokemonCardBody> createState() => _PokemonCardBodyState();
}

class _PokemonCardBodyState extends State<_PokemonCardBody> {
  bool isClicked = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: widget.height * 0.5,
          decoration: const BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
          ),
        ),
        Positioned(
          top: 10,
          right: 10,
          child: IconButton(
            onPressed: () {
              isClicked = !isClicked;
              setState(() {});
            },
            icon: isClicked
                ? const Icon(Icons.favorite)
                : const Icon(Icons.favorite_border),
            color: Colors.white,
            iconSize: 40,
          ),
        ),
        SizedBox(
          height: widget.height,
          child: Center(
            child: Column(
              children: [
                SizedBox(height: widget.height * 0.2),
                Container(
                  height: widget.height * 0.6,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(200),
                  ),
                  child: Image.network(
                    widget.pokemon.imageUrl,
                    fit: BoxFit.contain,
                    semanticLabel: 'Imágen de: ${widget.pokemon.name}',
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  widget.pokemon.name,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  'ID: ${widget.pokemon.id}',
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
