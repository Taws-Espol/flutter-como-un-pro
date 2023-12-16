// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_como_un_pro/app/providers/theme_provider.dart';
import 'package:flutter_como_un_pro/core/theme/custom_color.dart';
import 'package:flutter_como_un_pro/core/theme/custom_text.dart';
import 'package:flutter_como_un_pro/core/theme/dark_theme.dart';
import 'package:flutter_como_un_pro/core/theme/light_theme.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Caramel Coffee"),
        actions: [
          Consumer<ThemeProvider>(
            builder: (context, themeChanger, _) => Switch.adaptive(
              value: themeChanger.getTheme() == DarkTheme().theme,
              onChanged: (value) {
                if (value) {
                  themeChanger.setTheme(DarkTheme().theme);
                } else {
                  themeChanger.setTheme(LightTheme().theme);
                }
              },
            ),
          ),
        ],
      ),
      body: const Contenido(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: "Historial",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Inicio",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Configuración",
          ),
        ],
      ),
    );
  }
}

class Contenido extends StatelessWidget {
  const Contenido({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    const isDisabled = false;
    const colDivider = SizedBox(height: 16);
    final customText = Theme.of(context).extension<CustomText>()!;
    // final customColor = Theme.of(context).extension<CustomColor>()!;
    final themeChanger = Provider.of<ThemeProvider>(context, listen: false);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: ListView(
        children: [
          Text(
            "Hola, Axell",
            style: customText.bodyText1Bold,
          ),
          colDivider,
          colDivider,
          CardBalance(),
          colDivider,
          Placeholder(
            fallbackHeight: 26,
          ),
          colDivider,
          Wrap(
            spacing: 16,
            alignment: WrapAlignment.center,
            runSpacing: 16,
            children: [
              Categoria(nombre: "Frío"),
              Categoria(nombre: "Caliente"),
              Categoria(nombre: "Dulces"),
              Categoria(nombre: "Salados"),
              Categoria(nombre: "Marca"),
              Categoria(nombre: "Dieta"),
              Categoria(nombre: "Postres"),
              Categoria(nombre: "Vasos"),
            ],
          ),
          colDivider,
          ProductosDestacados(),
          colDivider,
          ProductosDestacados(),
          colDivider,
          ProductosDestacados(),
          colDivider,
          ProductosDestacados()
        ],
      ),
    );
  }
}

class ProductosDestacados extends StatelessWidget {
  const ProductosDestacados({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Productos Destacados"),
          SizedBox(height: 8),
          SizedBox(
            height: 140,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 30,
              itemBuilder: (BuildContext context, int index) => Padding(
                padding: EdgeInsets.only(left: index > 0 ? 16 : 0),
                child: const Column(
                  children: [
                    Placeholder(
                      fallbackHeight: 100,
                      fallbackWidth: 160,
                    ),
                    SizedBox(
                      width: 160,
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [Text("Capuchino"), Text("\$2.00")],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Categoria extends StatelessWidget {
  const Categoria({
    super.key,
    required this.nombre,
  });

  final String nombre;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 60,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Placeholder(
            fallbackHeight: 40,
            fallbackWidth: 40,
          ),
          Text(nombre)
        ],
      ),
    );
  }
}

class CardBalance extends StatelessWidget {
  const CardBalance({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: Placeholder(
        fallbackHeight: 160,
      ),
    );
  }
}
