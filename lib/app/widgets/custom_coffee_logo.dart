import 'package:flutter/material.dart';

class CustomCoffeeLogo extends StatelessWidget {
  const CustomCoffeeLogo({super.key});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(8),
      onTap: () {
        // ScaffoldMessenger.of(context).showSnackBar(
        //   const SnackBar(
        //     content: Text("Hola"),
        //   ),
        // );
        print('Hola');
      },
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
