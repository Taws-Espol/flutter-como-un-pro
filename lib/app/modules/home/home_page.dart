import 'package:provider/provider.dart';

import 'package:flutter/material.dart';

import 'package:flutter_como_un_pro/app/providers/theme_provider.dart';
import 'package:flutter_como_un_pro/app/widgets/widgets.dart';
import 'package:flutter_como_un_pro/core/theme/dark_theme.dart';
import 'package:flutter_como_un_pro/core/theme/light_theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  static const routeName = "/home";
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Caramel Coffee"),
        actions: [
          FutureBuilder(
            future: SharedPreferences.getInstance(),
            builder: (_, prefs) {
              final isDarkMode = prefs.data?.getBool("isDarkMode") ?? false;

              return Switch.adaptive(
                value: isDarkMode,
                onChanged: (value) {
                  print("Creeme es cierto: ${isDarkMode} - ${value} ");
                  prefs.data?.setBool("isDarkMode", value);
                  setState(() {});
                },
              );
            },
          ),

          // Consumer<ThemeProvider>(
          //   builder: (context, themeChanger, _) => Switch.adaptive(
          //     value: themeChanger.getTheme() == DarkTheme().theme,
          //     onChanged: (value) {
          //       if (value) {
          //         themeChanger.setTheme(DarkTheme().theme);
          //       } else {
          //         themeChanger.setTheme(LightTheme().theme);
          //       }
          //     },
          //   ),
          // ),
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
    const colDivider = SizedBox(height: 16);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ListView(
        children: const [
          Padding(
            padding: EdgeInsets.only(top: 16),
            child: Text(
              "Hola, Axell",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                letterSpacing: 0.5,
                color: Colors.blue,
              ),
            ),
          ),
          colDivider,
          colDivider,
          CustomCardBalance(),
          colDivider,
          CustomSearchBar(),
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
          const Text("Productos Destacados"),
          const SizedBox(height: 8),
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
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Capuchino"),
                        SizedBox(width: 8),
                        Text("\$2.00"),
                      ],
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
          CustomCoffeeLogo(
            beverageCategoryName: nombre,
          ),
          Text(nombre),
        ],
      ),
    );
  }
}
