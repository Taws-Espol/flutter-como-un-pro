import '../models/beverage/beverage_model.dart';

class BeverageApi {
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

  Future<Map<String, List<Beverage>>> getCompleteBeverageList() async {
    await Future.delayed(Duration(seconds: 2));
    return _beverageItems;
  }
}
