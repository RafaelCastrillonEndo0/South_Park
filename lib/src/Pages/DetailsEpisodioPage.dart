// lib/src/Pages/DetailsPage.dart
import 'package:flutter/material.dart';
import '../Components/CustomNavbar.dart';
import '../utils/constants.dart';

class DetailsEpisodioPage extends StatelessWidget {
  final String name;
  final String des;
  final int season;
  final int episode;
  final String createdAt;
  final String imagePath;

  const DetailsEpisodioPage({
    super.key,
    required this.name,
    required this.des,
    required this.season,
    required this.episode,
    required this.createdAt,
    required this.imagePath
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading:  BackButton(color: Colors.black),
      ),
      bottomNavigationBar:  CustomBottomNavBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          padding:  EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Image.asset(
                imagePath,
                height: 240,
                fit: BoxFit.contain,
              ),
               SizedBox(height: 14),
               Container(
                height: 350,
                width: 600,
                decoration: BoxDecoration(
                  color : const Color.fromARGB(255, 255, 255, 255),
                  boxShadow: [
                    BoxShadow(color: Colors.black12, blurRadius: 10, spreadRadius: 3,  offset: Offset(0, -3)),
                  ]
                ),
                child : Align(
                  alignment: Alignment.bottomLeft,
                  child: Container(
                    padding:  EdgeInsets.only(top: 30, left: 14),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Text(
                          name,
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 24,
                            fontWeight: FontWeight.w600
                            )
                          ),
                        ),
                        SizedBox(height: 10),
                        Align(
                          alignment : Alignment.bottomLeft,
                          child: Text(
                          createdAt,
                          style : TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 14,
                            color: Colors.grey
                            )
                          ),
                        ),
                        SizedBox(height: 10),
                        Align(
                          alignment : Alignment.bottomLeft,
                          child: Text(
                          des,
                          style : TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey
                            )
                          ),
                        )
                      ],
                    ),
                  ),
                )
               ),
                SizedBox(height: 10),
              Container(
                width: 600,
                height: 150,
                padding: const EdgeInsets.only(top: 15),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 255, 255, 255),
                  boxShadow: [
                    BoxShadow(color: Colors.black12, blurRadius: 10, spreadRadius: 3,  offset: Offset(0, 1)),
                  ]
                ),
                child: Wrap(
                  spacing: 24,
                  runSpacing: 24,
                  alignment: WrapAlignment.center,
                  children: [
                    _InfoItem(
                      icon: Icons.color_lens_outlined,
                      label: _textoLabel('Episodio $episode'),
                      sublabel: 'Episodio',
                    ),
                    _InfoItem(
                      icon: Icons.school_outlined,
                      label: _textoLabel('Temporada $season'),
                      sublabel: 'Temporada',
                    )
                  ],
                ),
              ),
               SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
  String _textoLabel(String s) => s.isEmpty ? s : '${s[0].toUpperCase()}${s.substring(1)}';
}

class _InfoItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final String sublabel;

  const _InfoItem({
    required this.icon,
    required this.label,
    required this.sublabel,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 64,
          height: 64,
          decoration: BoxDecoration(
            color: Colors.grey.shade100,
            shape: BoxShape.circle,
          ),
          child: Icon(icon, size: 32, color: customOrange),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(
            fontFamily: 'Poppins',
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          sublabel,
          style: const TextStyle(
            fontFamily: 'Poppins',
            fontSize: 12,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
