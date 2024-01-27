import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_como_un_pro/app/providers/beverage/beverage_provider.dart';
// import 'package:flutter_como_un_pro/app/providers/shared/shopping_cart_provider.dart';
import 'package:flutter_como_un_pro/app/widgets/widgets.dart';

import 'package:badges/badges.dart' as badges;
import 'package:flutter_como_un_pro/logic/cubit/beverage_cubit.dart';
import 'package:flutter_como_un_pro/logic/cubit/shopping_cart_cubit.dart';
import 'package:provider/provider.dart';

import '../../../data/models/models.dart';

class BeveragePage extends StatelessWidget {
  static const routeName = '/beverage';
  const BeveragePage({
    super.key,
    required this.beverageCategoryName,
  });

  final String beverageCategoryName;
  @override
  Widget build(BuildContext context) {
    final beverageCubit = context.read<BeverageCubit>();
    beverageCubit.getCompleteBeverageList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Bebida de tipo: $beverageCategoryName'),
      ),
      body:
          BlocBuilder<BeverageCubit, BeverageState>(builder: (context, state) {
        final beverageItems = state.beverageItems?[beverageCategoryName];
        if (state.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        return _BeveragePageBody(beverageItems);
      }),
      floatingActionButton: const _CustomFloatingActionButton(),
    );
  }
}

class _CustomFloatingActionButton extends StatelessWidget {
  const _CustomFloatingActionButton();

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      tooltip: 'Carrito de compras',
      backgroundColor: const Color.fromRGBO(183, 85, 137, 1),
      onPressed: () {
        // for (var item in shoppingCartProvider.items!) {
        //   print(item.name);
        // }
      },
      child: badges.Badge(
        position: badges.BadgePosition.custom(
          top: -15,
          end: -15,
        ),
        badgeStyle: const badges.BadgeStyle(
            badgeColor: Colors.white, shape: badges.BadgeShape.circle),
        badgeContent: BlocBuilder<ShoppingCartCubit, ShoppingCartState>(
          builder: (context, state) {
            final items = state.items ?? [];
            return Text('${items.length}');
          },
        ),
        child: const Icon(Icons.shopping_cart),
      ),
    );
  }
}

class _BeveragePageBody extends StatelessWidget {
  const _BeveragePageBody(this.beverageItems);

  final List<Beverage>? beverageItems;

  @override
  Widget build(BuildContext context) {
    if (beverageItems == null) {
      return const Center(
        child: Text('No hay bebidas disponibles'),
      );
    }
    final shoppingCubit = context.read<ShoppingCartCubit>();

    return ListView.builder(
      itemCount: beverageItems!.length,
      itemBuilder: (context, index) {
        final Beverage beverage = beverageItems![index];
        return InkWell(
          key: Key(beverage.name),
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
            child: Row(
              children: [
                // * Imagen con el nombre de la bebida
                SizedBox(
                  width: 100,
                  child: Column(
                    children: [
                      //* Imagen
                      const CustomCoffeeLogo(),
                      const SizedBox(height: 16),
                      //* Nombre
                      Text(
                        beverage.name,
                        style: const TextStyle(fontSize: 14),
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                ),
                const SizedBox(width: 16),

                //* Descripción, Nombre en negrita y precio
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(beverage.name),
                      Text(beverage.description),
                      Text('\$ ${beverage.price}'),
                    ],
                  ),
                ),

                //* Botón de añadir (+)
                IconButton(
                  key: Key('item_$index'),
                  onPressed: () {
                    shoppingCubit.addItem(beverage);
                  },
                  icon: const Icon(Icons.add),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
