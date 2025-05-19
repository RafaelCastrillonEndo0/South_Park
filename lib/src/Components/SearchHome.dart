// lib/src/Components/SearchHome.dart
import 'package:flutter/material.dart';

class SearchHome extends StatelessWidget {
  final String query;
  final ValueChanged<String> onSearch;

  const SearchHome({
    super.key,
    required this.query,
    required this.onSearch,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        children: [
          Image.asset(
            'assets/images/southpark.png',
            height: 97,
            width: 93,
          ),
          Expanded(
            child: Container(
              height: 40,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10,
                    spreadRadius: 10,
                    offset: Offset(0, 1),
                  ),
                ],
              ),
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Icon(Icons.search, color: Colors.grey),
                  SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      onChanged: onSearch,
                      controller: TextEditingController(text: query)
                        ..selection = TextSelection.fromPosition(
                          TextPosition(offset: query.length),
                        ),
                      decoration: InputDecoration.collapsed(
                        hintText: 'Buscar Personaje',
                        hintStyle: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 14,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
