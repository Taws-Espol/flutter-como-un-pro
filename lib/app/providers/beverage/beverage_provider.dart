import 'package:flutter/material.dart';
import 'package:flutter_como_un_pro/models/models.dart';

class BeverageProvider with ChangeNotifier {
  final Map<String, List<Beverage>> _beverageItems = {
    'Frío': [
      Beverage(
        name: 'Caramel Frappuccino',
        description:
            'Café expreso, leche, hielo, jarabe de caramelo y crema batida.',
        price: 5.99,
      ),
      Beverage(
        name: 'Mocha Frappuccino',
        description:
            'Café expreso, leche, hielo, jarabe de chocolate y crema batida.',
        price: 5.99,
      ),
      Beverage(
        name: 'Frappuccino de Vainilla',
        description:
            'Café expreso, leche, hielo, jarabe de caramelo y crema batida.',
        price: 5.99,
      ),
      Beverage(
        name: 'Mocha Frappuccino',
        description:
            'Café expreso, leche, hielo, jarabe de chocolate y crema batida.',
        price: 5.99,
      ),
      Beverage(
        name: 'Caramel Frappuccino',
        description:
            'Café expreso, leche, hielo, jarabe de caramelo y crema batida.',
        price: 5.99,
      ),
      Beverage(
        name: 'Caramel Latte',
        description:
            'Café expreso, leche, hielo, jarabe de chocolate y crema batida.',
        price: 5.99,
      ),
    ],
    'Caliente': [
      Beverage(
        name: 'Caramel Macchiato',
        description: 'Café expreso, leche, jarabe de caramelo y crema batida.',
        price: 5.99,
      ),
      Beverage(
        name: 'Caramel Latte',
        description: 'Leche, jarabe de chocolate y crema batida.',
        price: 5.99,
      ),
    ],
  };

  BeverageProvider();

  List<Beverage>? getBeverageByCategory(String category) {
    if (!_beverageItems.containsKey(category)) return null;

    return _beverageItems[category];
  }
}
