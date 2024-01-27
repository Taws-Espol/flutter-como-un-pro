part of 'shopping_cart_cubit.dart';

class ShoppingCartState {
  List<Beverage>? items;

  ShoppingCartState({
    this.items,
  });

  ShoppingCartState copyWith({
    List<Beverage>? items,
  }) {
    return ShoppingCartState(
      items: items ?? this.items,
    );
  }
}
