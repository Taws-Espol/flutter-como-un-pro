import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomCoffeeLogo extends StatelessWidget {
  const CustomCoffeeLogo({
    super.key,
    this.beverageCategoryName,
  });

  final String? beverageCategoryName;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(8),
      onTap: beverageCategoryName != null
          ? () {
              context.pushNamed('/beverage',
                  extra: {'beverageName': beverageCategoryName});
            }
          : null,
      child: Stack(
        children: [
          SizedBox(
            height: 54,
            width: 54,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[300]!,
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          SizedBox(
            child: Image.asset(
              "assets/coffee.png",
              height: 54,
              width: 54,
            ),
          )
        ],
      ),
    );
  }
}
