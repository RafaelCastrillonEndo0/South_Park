// lib/src/Pages/HomePage.dart
import 'package:flutter/material.dart';
import '../Components/SearchHome.dart';
import '../Components/FilterButtonsHome.dart';
import '../Components/CustomNavbar.dart';
import '../Components/CardHome.dart';
import '../Components/CardEpisodioHome.dart';
import '../Providers/list_provider_json.dart';
import '../Providers/list_provider_json_episodios.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeFilter selectedFilter = HomeFilter.characters;
  String searchQuery = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: const CustomBottomNavBar(),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SearchHome(
                query: searchQuery,
                onSearch: (value) => setState(() => searchQuery = value),
              ),
            ),
            const SizedBox(height: 35),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Filtros',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(height: 22),
            FilterButtonsHome(
              selected: selectedFilter,
              onFilterChange: (filter) => setState(() {
                selectedFilter = filter;
                searchQuery = '';
              }),
            ),
            const SizedBox(height: 22),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                selectedFilter == HomeFilter.episodes
                    ? 'Episodios'
                    : selectedFilter == HomeFilter.carousel
                        ? 'Carrusel'
                        : 'Personajes',
                style: const TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(height: 30),
            Expanded(child: _buildContent()),
          ],
        ),
      ),
    );
  }

  Widget _buildContent() {
    switch (selectedFilter) {
      case HomeFilter.episodes:
        return _buildEpisodesList();
      case HomeFilter.carousel:
        return _buildCarousel();
      case HomeFilter.characters:
        return _buildCharacterList();
    }
  }

  Widget _buildCarousel() {
    return FutureBuilder<List<dynamic>>(
      future: listProviderJson.cargarDatos(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return const Center(
              child: Text('Error al cargar los personajes.'));
        }
        final personajes = (snapshot.data ?? [])
            .where((p) =>
                (p['name'] as String)
                    .toLowerCase()
                    .contains(searchQuery.toLowerCase()))
            .toList();
        if (personajes.isEmpty) {
          return Center(
              child: Text("No hay resultados para \"$searchQuery\""));
        }
        return PageView.builder(
          controller: PageController(viewportFraction: 0.7),
          itemCount: personajes.length,
          itemBuilder: (context, index) {
            final p = personajes[index];
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                        p['img'],
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    p['name'],
                    style: const TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildCharacterList() {
    return FutureBuilder<List<dynamic>>(
      future: listProviderJson.cargarDatos(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return const Center(child: Text('Error al cargar los personajes.'));
        }
        final personajes = snapshot.data ?? [];
        final filtered = personajes.where((p) {
          return (p['name'] as String)
              .toLowerCase()
              .contains(searchQuery.toLowerCase());
        }).toList();
        if (filtered.isEmpty) {
          return Center(
              child: Text("No hay resultados para \"$searchQuery\""));
        }
        return ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          itemCount: filtered.length,
          itemBuilder: (context, index) {
            final personaje = filtered[index];
            return Column(
              children: [
                const SizedBox(height: 10),
                CardHome(
                  name: personaje['name'],
                  role: personaje['role'],
                  age: '${personaje["age"]} años',
                  imagePath: personaje['img'],
                  hairColor: personaje['hair_color'],
                  occupation: personaje['occupation'],
                  gender: personaje['sex'],
                  updatedAt: personaje['updatedAt'],
                  religion: personaje['religion'],
                ),
                const SizedBox(height: 10),
              ],
            );
          },
        );
      },
    );
  }

  Widget _buildEpisodesList() {
    return FutureBuilder<List<dynamic>>(
      future: listProviderEpisodiosJson.cargarEpisodios(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return const Center(child: Text('Error al cargar los episodios.'));
        }
        final episodios = snapshot.data ?? [];
        final filtered = episodios.where((e) {
          final title = (e['name'] as String).toLowerCase();
          final desc = (e['description'] as String).toLowerCase();
          return title.contains(searchQuery.toLowerCase()) ||
              desc.contains(searchQuery.toLowerCase());
        }).toList();
        if (filtered.isEmpty) {
          return Center(
              child: Text("No hay resultados para \"$searchQuery\""));
        }
        return ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          itemCount: filtered.length,
          itemBuilder: (context, index) {
            final episodio = filtered[index];
            return Column(
              children: [
                const SizedBox(height: 10),
                CardEpisodioHome(
                  name: episodio['name'],
                  des: episodio['description'],
                  season: episodio['season'],
                  episode: episodio['episode'],
                  createdAt: episodio['air_date'],
                  imagePath: episodio['thumbnail_url'],
                ),
                const SizedBox(height: 10),
              ],
            );
          },
        );
      },
    );
  }
}