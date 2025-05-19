import 'package:flutter/material.dart';
import '/src/Pages/DetailsEpisodioPage.dart';  


class CardEpisodioHome extends StatelessWidget {
  final String name;
  final String des;
  final int season;
  final int episode;
  final String createdAt;
  final String imagePath;

  const CardEpisodioHome({
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
    return Container(
      width: 346,
      height: 130,
      margin:  EdgeInsets.only(bottom: 16),
      padding:  EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 10, spreadRadius: 3,  offset: Offset(0, 1)),
        ],
      ),
      child: Stack(
        children: [
          Row(
            children: [
              Image.asset(imagePath, height: 66, width: 89, fit: BoxFit.cover),
              SizedBox(width: 30),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 5.5),
                    Text(
                      name,
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.normal,
                        fontSize: 16.5,
                      ),
                    ),
                    SizedBox(height: 3),
                    Text(
                      'Eposodio $episode',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w300,
                        fontStyle: FontStyle.italic,
                        fontSize: 14.5,
                      ),
                    ),
                    SizedBox(height: 3),
                    Row(
                      children: [
                        Icon(Icons.movie, size: 13),
                        SizedBox(width: 8),
                        Text(
                          'Temporada $season',
                          style : TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.normal,
                            color: Color.fromARGB(255, 0, 0, 0),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),

          Positioned(
            bottom: 3,
            right: 10,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailsEpisodioPage(
                      name : name,
                      des : des,
                      season : season,
                      episode : episode,
                      createdAt : createdAt,
                      imagePath : imagePath
                    ),
                  ),
                );
              },
              child: Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(30, 31, 46, 1),
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
                child: Icon(
                  Icons.arrow_forward_sharp,
                  size: 24,
                  color: const Color.fromARGB(249, 255, 255, 255),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}