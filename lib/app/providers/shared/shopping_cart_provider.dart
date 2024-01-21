import 'package:flutter/material.dart';
import 'package:flutter_como_un_pro/core/models/models.dart';

class ShoppingCartProvider with ChangeNotifier {
  List<Beverage>? _items = [];

  List<Beverage>? get items => _items;

  int get itemsCount => _items?.length ?? 0;

  void addItem(Beverage beverage) {
    _items = [...items!, beverage];
    notifyListeners();
  }

  void removeItem(Beverage beverage) {
    _items?.removeWhere((element) => element.id == beverage.id);
    notifyListeners();
  }
}
