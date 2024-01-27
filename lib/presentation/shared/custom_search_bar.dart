import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      width: 300,
      child: TextFormField(
        decoration: InputDecoration(
          filled: true,
          contentPadding: const EdgeInsets.all(0),
          alignLabelWithHint: true,
          fillColor: Colors.grey[300],
          hintText: "Buscar...",
          prefixIcon: const Icon(
            Icons.search,
            color: Colors.black,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(color: Colors.transparent),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(color: Colors.transparent),
          ),
        ),
        cursorColor: Colors.black,
      ),
    );
  }
}
