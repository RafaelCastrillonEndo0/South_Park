// lib/src/Components/FilterButtonsHome.dart
import 'package:flutter/material.dart';
import '../utils/constants.dart';

enum HomeFilter { characters, episodes, carousel }

class FilterButtonsHome extends StatelessWidget {
  final HomeFilter selected;
  final ValueChanged<HomeFilter> onFilterChange;

  const FilterButtonsHome({
    super.key,
    required this.selected,
    required this.onFilterChange,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 4),
      padding: const EdgeInsets.all(12),
      child: Row(
        children: HomeFilter.values.map((filter) {
          final label = filter == HomeFilter.characters
              ? 'Todos'
              : filter == HomeFilter.episodes
                  ? 'Episodios'
                  : 'Carrusel';
          final icon = filter == HomeFilter.characters
              ? Icons.people_alt_sharp
              : filter == HomeFilter.episodes
                  ? Icons.play_circle_outline
                  : Icons.view_carousel;
          final isSelected = filter == selected;
          return Padding(
            padding: const EdgeInsets.only(right: 16),
            child: ElevatedButton(
              onPressed: () => onFilterChange(filter),
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    isSelected ? customOrange : Colors.grey.shade300,
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                fixedSize: const Size(100, 78),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(icon,
                      color: isSelected ? Colors.white : Colors.black87,
                      size: 30),
                  const SizedBox(height: 4),
                  Text(
                    label,
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: isSelected ? Colors.white : Colors.black87,
                    ),
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
