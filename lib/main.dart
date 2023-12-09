import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
    return const SafeArea(
      child: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Placeholder(
                fallbackHeight: 200,
                fallbackWidth: 200,
              ),
              SizedBox(
                height: 20,
              ),
              Placeholder(
                fallbackHeight: 200,
                fallbackWidth: 200,
              ),
              SizedBox(
                height: 20,
              ),
              Placeholder(
                fallbackHeight: 200,
                fallbackWidth: 200,
              ),
              SizedBox(
                height: 20,
              ),
              Placeholder(
                fallbackHeight: 200,
                fallbackWidth: 200,
              ),
              SizedBox(
                height: 20,
              ),
              Placeholder(
                fallbackHeight: 200,
                fallbackWidth: 200,
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
