import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_como_un_pro/data/models/beverage/beverage_model.dart';

part 'shopping_cart_state.dart';

class ShoppingCartCubit extends Cubit<ShoppingCartState> {
  ShoppingCartCubit() : super(ShoppingCartState(items: []));

  void addItem(Beverage beverage) {
    final items = state.items ?? [];
    emit(state.copyWith(items: [...items, beverage]));
  }

  void removeItem(Beverage beverage) {
    final items = state.items ?? [];
    final filteredItems = items.where((element) => element.id != beverage.id);
    emit(state.copyWith(items: filteredItems.toList()));
  }
}
